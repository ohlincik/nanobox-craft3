# Craft CMS 3 in a container using Nanobox

Use this repository and the following instructions to automatically configure and run [Craft CMS 3](https://craftcms.com/) using [Nanobox](https://nanobox.io).

## Download and Install Nanobox

[Create a free Nanobox account](https://dashboard.nanobox.io/users/register) and [download and install Nanobox](https://dashboard.nanobox.io/download).

## Create a New Project Directory and Run the Bootstrap

```bash
# create a new project directory and cd in
mkdir nanobox-craft3 && cd $_

# run the bootstrap
bash <(curl -sL https://git.io/fpPHA)
```

## You're ready to develop!

This will do the following:

- Create and configure a new instance of Nanobox environment
- Install and configure PHP 7.1 with all necessary extensions
- Install and configure PHP-FPM
- Install and configure Nginx server
- Install the MySql CLI to allow the Craft CP to backup the DB
- Install Composer to manage all PHP dependencies
- Install and configure MySql Database server
- Create and configure a new Craft CMS 3 project

You'll find the IP where you can see the running app in the output.

---

## Add a DNS Alias

Nanobox lets you easily add a local URL to access your Craft app in the browser. To add a DNS alias, run the following from the root of your project _(outside the Nanobox console)_.

```bash
nanobox dns add local nanobox-craft3.test
```

After you `nanobox run php-server`, you'd be able to access the running app at `http://nanobox-craft3.test`.

## Developing your Project

Once the project is provisioned, simply open the project directory `nanobox-craft3` in your code editor and start developing.

You can drop into a console in the environment at any time by running:

```bash
nanobox run
```

Your local codebase is mounted into the dev container. Any changes to the code are reflected in your dev app. You can add and load dependencies or any other dev tasks. Or you can simply start Craft.

```bash
php-server
```

### Deployment

1. [Create a new app in your Nanobox dashboard](https://docs.nanobox.io/workflow/launch-app/)
2. Add your new app as a remote on your project:
    ```bash
    nanobox remote add app-name
    ```
3. Deploy to your live app:
    ```bash
    nanobox deploy
    ```
