<?php
/**
 * Yii Application Config
 *
 * Edit this file at your own risk!
 *
 * The array returned by this file will get merged with
 * vendor/craftcms/cms/src/config/app.php and app.[web|console].php, when
 * Craft's bootstrap script is defining the configuration for the entire
 * application.
 *
 * You can define custom modules and system components, and even override the
 * built-in system components.
 *
 * If you want to modify the application config for *only* web requests or
 * *only* console requests, create an app.web.php or app.console.php file in
 * your config/ folder, alongside this one.
 */

return [
    'modules' => [
        'my-module' => \modules\Module::class,
    ],
    'components' => [
        'redis' => [
            'class' => 'yii\redis\Connection',
            'hostname' => $_ENV['DATA_REDIS_HOST'],
            'port' => 6379,
            'database' => 0,
        ],
        'cache' => [
            'class' => 'yii\redis\Cache',
            'redis' => [
                'hostname' => $_ENV['DATA_REDIS_HOST'],
                'port' => 6379,
                'database' => 1,
            ],
        ],
        'session' => function() {
            $stateKeyPrefix = md5('Craft.'.craft\web\Session::class.'.'.Craft::$app->id);
            $session = Craft::createObject([
                'class' => yii\redis\Session::class,
                'flashParam' => $stateKeyPrefix.'__flash',
                'name' => Craft::$app->getConfig()->getGeneral()->phpSessionName,
                'cookieParams' => Craft::cookieConfig(),
            ]);
            $session->attachBehaviors([craft\behaviors\SessionBehavior::class]);
            return $session;
        },
    ]
];
