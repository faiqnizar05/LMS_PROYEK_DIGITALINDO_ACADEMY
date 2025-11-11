<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Schema;
use App\Models\SMTP;

class MailConfigServiceProvider extends ServiceProvider
{
    public function register(): void
    {
        //
    }

    public function boot(): void
    {
        // Cegah error saat migrasi pertama kali
        if (Schema::hasTable('smtps')) {
            $smtp = SMTP::first();
            if ($smtp) {
                Config::set('mail.mailers.smtp.host', $smtp->host);
                Config::set('mail.mailers.smtp.port', $smtp->port);
                Config::set('mail.mailers.smtp.username', $smtp->username);
                Config::set('mail.mailers.smtp.password', $smtp->password);
                Config::set('mail.mailers.smtp.encryption', $smtp->encryption);
                Config::set('mail.from.address', $smtp->from_address);
                Config::set('mail.from.name', $smtp->from_name);
            }
        }
    }
}
