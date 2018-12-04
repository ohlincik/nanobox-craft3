<?php
/**
 * Database Configuration
 *
 * All of your system's database connection settings go in here. You can see a
 * list of the available settings in vendor/craftcms/cms/src/config/DbConfig.php.
 *
 * @see craft\config\DbConfig
 */

return [
    'driver' => getenv('DB_DRIVER'),
    'server' => $_ENV['DATA_DB_HOST'],
    'user' => $_ENV['DATA_DB_USER'],
    'password' => $_ENV['DATA_DB_PASS'],
    'database' => 'gonano',
    'schema' => getenv('DB_SCHEMA'),
    'tablePrefix' => getenv('DB_TABLE_PREFIX'),
    'port' => getenv('DB_PORT')
];
