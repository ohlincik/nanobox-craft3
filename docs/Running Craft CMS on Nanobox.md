# Running Craft CMS on Nanobox

1. Clone the Craft CMS project into new directory `git clone --depth 1 https://github.com/craftcms/craft.git nanobox-craft`
2. Open the `composer.json` file and replace "post-create-project-cmd" with "post-root-package-install"
3. Copy `boxfile.yml` and `nginx.conf` into the directory
4. cd into the directory and run `nanobox run`
5. Add local DNS `nanobox dns add local craft.nanobox.test`
6. 

## Issues with mount-type

On MacOS it may be necessary switch to the native mount type because the **netfs** mount type throws an error. You can switch by running the following:

```bash
# Make sure the Nanobox VM is stopped
nanobox stop

# Switch to the native mount-type
nanobox config set mount-type native

# Start the Nanobox VM
nanobox start
```

[Counsult the following article](https://content.nanobox.io/installing-nanobox-on-macos-high-sierra/) for more information.

## Upgrade VirtualBox

To upgrade VirtualBox, download a new version and run it.

https://www.virtualbox.org/wiki/Downloads