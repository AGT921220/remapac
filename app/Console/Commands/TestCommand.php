<?php

namespace App\Console\Commands;

use App\Features\Notification\UseCases\FirebaseNotificationService;
use App\Models\User;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Hash;

class TestCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'test';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Execute the console command.
     */
    public function handle(FirebaseNotificationService $firebaseNotificationService): void
    {
        // Aquí puedes llamar al servicio de notificaciones de Firebase
        // Por ejemplo, enviar una notificación a un dispositivo específico
        $deviceToken = 'eVdmOCTrSbO5SZEwZIRIZE:APA91bFXFXbMfw4oj7OySVj-07m1IwmFWJfoEDT-io7fSbWVykczIbnt7dEQ6ZhB0Y2fcM0S5HbmqB70T-fAATAwuAngnPfnUH9vBjtM_cvZFOM1vZi0lD8';

        try {
            $response = $firebaseNotificationService->sendNotification($deviceToken);
            $this->info('Notificación enviada exitosamente: ' . json_encode($response));
        } catch (\Exception $e) {
            $this->error('Error al enviar la notificación: ' . $e->getMessage());
        }
    }


    //  User::create([
    //     'name' => 'Admin Demo',
    //     'email' => 'admin@demo.com',
    //     'password' => Hash::make('admin'), // contraseña: password123
    // ]);
}
