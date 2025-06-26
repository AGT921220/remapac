<?php

namespace App\Features\Notification\UseCases;

use Google\Auth\OAuth2;
use Google\Auth\Credentials\ServiceAccountCredentials;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Storage;

class SendPushNotification
{
    protected string $projectId = 'remapac-fc66e';

    protected function getAccessToken(): string
    {
        $credentialsPath = storage_path('app/remapac-firebase.json');

        $scopes = ['https://www.googleapis.com/auth/cloud-platform'];

        $auth = new ServiceAccountCredentials($scopes, $credentialsPath);
        $accessTokenInfo = $auth->fetchAuthToken();

        if (!isset($accessTokenInfo['access_token'])) {
            throw new \Exception('No se pudo obtener el token de acceso');
        }

        return $accessTokenInfo['access_token'];
    }

    public function sendNotification(string $deviceToken, string $title, string $body, string $url)
    {
        $accessToken = $this->getAccessToken();

        $url = "https://fcm.googleapis.com/v1/projects/{$this->projectId}/messages:send";
        $payload = [
            'message' => [
                'token' => $deviceToken,
                'data' => [
                    // 'title' => $title,
                    // 'body' => $body,
                    // 'url' => 'remapacapp://'.$url,
                    'url' => 'remapacapp://solicited-services',
                ],

                'notification' => [
                    'title' => $title,
                    'body' => $body,
                    // 'url' => 'remapacapp://' . $url,
                ],
                // 'data' => [
                //     'url' => 'remapacapp://solicited-services',
                // ],
                'android' => [
                    'notification' => [
                        'sound' => 'custom-sound.mp3',
                    ],
                ],
            ],
        ];

        $response = Http::withToken($accessToken)
            ->withHeaders(['Content-Type' => 'application/json'])
            ->post($url, $payload);

        if ($response->failed()) {
//            throw new \Exception('Error al enviar la notificación: ' . $response->body());
        }

        return $response->json();
    }
}
