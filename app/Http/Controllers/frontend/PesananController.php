<?php

namespace App\Http\Controllers\frontend;

use App\Models\Order;
use App\Models\Payment;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Http;

class PesananController extends Controller
{
    public function submit(Request $request)
    {
        try {
            // Validasi input
            $validated = $request->validate([
                'course_id' => 'required|exists:courses,id',
                'instructor_id' => 'required|exists:users,id',
                'course_title' => 'required|string',
                'price' => 'required|numeric|min:0',
            ]);

            $auth = Auth::user(); 

            if (!$auth) {
                return response()->json([
                    'status' => 'error',
                    'message' => 'User tidak terautentikasi'
                ], 401);
            }

            // Buat order
            $order = Order::create([
                'user_id' => $auth->id,
                'course_id' => $validated['course_id'],
                'instructor_id' => $validated['instructor_id'],
                'course_title' => $validated['course_title'],
                'price' => $validated['price'],
            ]);

            // Generate invoice number
            $invoice_no = 'DIAC' . date('YmdHis') . $order->id;

            // Buat payment record
            $payment = Payment::create([
                'transaction_id' => $invoice_no,
                'name' => $auth->name,
                'email' => $auth->email,
                'phone' => $auth->phone ?? '-',
                'address' => $auth->address ?? '-',
                'total_amount' => $validated['price'],
                'payment_type' => '-',
                'invoice_no' => '-',
                'status' => 'PENDING',
            ]);

            // Gunakan HTTP Client langsung ke API Midtrans
            $snapToken = $this->getSnapTokenDirect($invoice_no, $validated['price'], $auth, $validated);

            // Update order dengan snap token
            $order->update(['snap_token' => $snapToken]);

            return response()->json([
                'status' => 'success',
                'message' => 'Pesanan berhasil dibuat',
                'snap_token' => $snapToken,
                'order_id' => $invoice_no
            ], 200);

        } catch (\Exception $e) {
            \Log::error('Error creating order: ' . $e->getMessage());
            
            return response()->json([
                'status' => 'error',
                'message' => 'Gagal membuat pesanan: ' . $e->getMessage(),
            ], 500);
        }
    }

    private function getSnapTokenDirect($orderId, $amount, $user, $courseData)
    {
        $serverKey = config('midtrans.server_key');
        $isProduction = config('midtrans.is_production');
        
        $baseUrl = $isProduction 
            ? 'https://app.midtrans.com/snap/v1' 
            : 'https://app.sandbox.midtrans.com/snap/v1';

        $payload = [
            'transaction_details' => [
                'order_id' => $orderId,
                'gross_amount' => (int) $amount,
            ],
            'customer_details' => [
                'first_name' => $user->first_name ?? $user->name ?? 'Customer',
                'email' => $user->email,
                'phone' => $user->phone ?? '',
            ],
            'item_details' => [
                [
                    'id' => $courseData['course_id'],
                    'price' => (int) $amount,
                    'quantity' => 1,
                    'name' => $courseData['course_title'],
                ]
            ]
        ];

        $response = Http::withOptions([
            'verify' => false, // Nonaktifkan verifikasi SSL
            'timeout' => 30,
        ])->withHeaders([
            'Content-Type' => 'application/json',
            'Authorization' => 'Basic ' . base64_encode($serverKey . ':'),
        ])->post($baseUrl . '/transactions', $payload);

        if ($response->failed()) {
            throw new \Exception('Midtrans API Error: ' . $response->body());
        }

        $data = $response->json();
        
        return $data['token'] ?? null;
    }
}