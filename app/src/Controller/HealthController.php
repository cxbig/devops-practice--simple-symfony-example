<?php

namespace App\Controller;

use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Annotation\Route;

class HealthController
{
    #[Route('/health', name: 'health_check')]
    public function index(): JsonResponse
    {
        // check database connection
        $mysqlOK = true; // replace it with your database connection check
        if (!$mysqlOK) {
            return $this->respond(500, 'mysql connection error');
        }

        // check redis connection
        $redisOk = true; // replace it with your redis connection check
        if (!$redisOk) {
            return $this->respond(500, 'redis connection error');
        }

        return $this->respond();
    }

    private function respond(int $code = 200, string $message = ''): JsonResponse
    {
        $status = ($code === 200) ? 'ok' : 'error';
        return new JsonResponse([
            'status' => $status,
            'message' => $message,
        ], $code);
    }
}
