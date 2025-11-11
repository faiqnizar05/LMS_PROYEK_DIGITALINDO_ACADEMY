<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Schema;
use App\Models\Stripe;

class StripeServiceProvider extends ServiceProvider
{
    public function register(): void
    {
        //
    }

    public function boot(): void
    {
        // Hindari error jika tabel 'stripes' belum dibuat
        if (Schema::hasTable('stripes')) {
            $stripeConfig = Stripe::first();
            if ($stripeConfig) {
                Config::set('services.stripe.key', $stripeConfig->key);
                Config::set('services.stripe.secret', $stripeConfig->secret);
            }
        }
    }
}
