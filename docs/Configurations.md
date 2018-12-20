# Configurations

## Add Redis for sessions and caching

### Adjust the `boxfile.yml`

Add the following to the file in the appropriate places

    run.config:
      engine.config:
        extensions:
          - redis
    data.redis:
      image: nanobox/redis:3.0

### Update the `config/app.php`

    return [
        'modules' => [
            ...
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

## Enable Zend Extensions

You can enable the OPcache for staging/production and Xdebug for development

### Adjust the `boxfile.yml`

Add the following to the file in the appropriate places

    run.config:
      engine.config:
        zend_extensions:
          - opcache
        dev_zend_extensions:
          add:
            - xdebug
          rm:
            - opcache

## Use Postgres instead of MySql

### Adjust the `boxfile.yml`

Replace the **data.db** directive

    data.db:
      image: nanobox/postgresql:9.5

### Adjust the `.env`

    DB_DRIVER="pgsql"
    DB_SCHEMA="public"
    DB_PORT="5432"

