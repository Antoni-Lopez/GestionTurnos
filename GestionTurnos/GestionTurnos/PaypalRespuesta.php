<?php

namespace Sample;

use PayPalCheckoutSdk\Core\PayPalHttpClient;
use PayPalCheckoutSdk\Core\SandboxEnvironment;

ini_set('error_reporting', E_ALL); // or error_reporting(E_ALL);
ini_set('display_errors', '1');
ini_set('display_startup_errors', '1');

class PayPalClient
{
    /**
     * Returns PayPal HTTP client instance with environment that has access
     * credentials context. Use this instance to invoke PayPal APIs, provided the
     * credentials have access.
     */
    public static function client()
    {
        return new PayPalHttpClient(self::environment());
    }

    /**
     * Set up and return PayPal PHP SDK environment with PayPal access credentials.
     * This sample uses SandboxEnvironment. In production, use ProductionEnvironment.
     */
    public static function environment()
    {
        $clientId = getenv("CLIENT_ID") ?: "AQjOeBCn3OzBHoByhXhGgqiaoO_LpmZwbiumV0JZ3H4URf5jEC9zxlaAAdfLb4DsmSaAw-B7vQlybLls";
        $clientSecret = getenv("CLIENT_SECRET") ?: "EOhQwG1uO01-bMjikR1SNiRaL4iOSlhVpfknjLiURYcVvti9XRElQ2tK4udTUpx9h_bhzJECRefI-j1h";
        return new SandboxEnvironment($clientId, $clientSecret);
    }
}