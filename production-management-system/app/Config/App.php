<?php

namespace Config;

use CodeIgniter\Config\BaseConfig;

class App extends BaseConfig
{
    public $baseURL = 'http://localhost/production-management-system/';
    
    public $indexPage = '';
    
    public $uriProtocol = 'REQUEST_URI';
    
    public $urlSuffix = '';
    
    public $defaultLocale = 'en';
    
    public $negotiateLocale = false;
    
    public $supportedLocales = ['en'];
    
    public $appTimezone = 'UTC';
    
    public $sessionDriver = 'CodeIgniter\Session\Handlers\DatabaseHandler';
    
    public $sessionCookieName = 'ci_session';
    
    public $sessionExpiration = 7200;
    
    public $sessionSavePath = 'ci_sessions';
    
    public $database = [
        'DSN'      => '',
        'hostname' => 'localhost',
        'username' => 'root',
        'password' => '',
        'database' => 'db_production',
        'DBDriver' => 'MySQLi',
        'DBPrefix' => '',
        'pConnect' => false,
        'DBDebug'  => (ENVIRONMENT !== 'production'),
        'cacheOn'  => false,
        'cachedir' => '',
        'charSet'  => 'utf8',
        'DBCollat' => 'utf8_general_ci',
        'swap_pre' => '',
        'encrypt'  => false,
        'compress' => false,
        'strictOn' => false,
        'failover' => [],
        'saveQueries' => true,
    ];
}