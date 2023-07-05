(dev-nixos-virtualbox)=

# NixOS Virtualbox Dev VM

You can use the official NixOS VirtualBox appliance if you want to run the project
on our preferred production system [NixOS](https://nixos.org).

This will guide you from downloading the appliance to a running application.

:::{note}
You need [VirtualBox](https://www.virtualbox.org) installed on your system.
:::

:::{note}
If you want to run the application elsewhere, please look at {ref}`quickstart`
:::

## VM Preparation

The following code snippets are written for *ekklesia-portal* but
also work for *ekklesia-voting* when you change the project name.

1. Get the [NixOS 22.11 VirtualBox appliance](https://nixos.org/download.html#nixos-virtualbox)
   and follow the instructions there to import and start the VM.
   Enable clipboard integration in the VirtualBox menu bar with *Devices -> Shared Clipboard -> Host to Guest*
   so you can copy-paste longer commands from here.

2. In the VM, open {command}`konsole` (press {command}`Alt-F1` and type *konsole*) and run the following commands as the demo user.

3. Add the *edemocracy* binary cache:

   ```
   # password for sudo is `demo`
   nix-shell -p cachix --run "sudo cachix use edemocracy"
   # ignore the instructions shown by cachix, we do that later.
   ```

4. Edit {file}`/etc/nixos/configuration.nix` (using `sudo nano /etc/nixos/configuration.nix`, for example) and change the `imports` line to:

   ```
   # no commas between list items in Nix!
   imports = [
     <nixpkgs/nixos/modules/installer/virtualbox-demo.nix>
     ./ekklesia_dev.nix
   ];
   ```

5. Fetch our recommended NixOS configuration with curl
   and put it in {file}`/etc/nixos` (you can also {download}`download it here<./ekklesia_dev.nix>`):

   ```
   curl -O https://raw.githubusercontent.com/edemocracy/ekklesia/master/docs/development/ekklesia_dev.nix
   sudo mv ekklesia_dev.nix /etc/nixos
   ```

6. Rebuild the NixOS system to activate the new configuration and run zsh as 
   new shell:

   ```
   sudo nixos-rebuild switch
   zsh
   ```

7. Tell [direnv](https://direnv.net) where [nix-direnv](https://github.com/nix-community/nix-direnv) is located:

   ```
   echo "source /run/current-system/sw/share/nix-direnv/direnvrc" > ~/.direnvrc
   ```

## Setting up the Project

1. Clone the repository and change to the checked out directory:

   ```
   git clone https://github.com/edemocracy/ekklesia-portal
   cd ekklesia-portal
   ```

2. Tell `direnv` to use `nix-direnv` whenever you enter the directory. `nix-direnv` starts building immediately which may take a while:

   ```
   cp envrc.example .envrc
   direnv allow
   # direnv runs nix build now
   ```
   
   You can run `direnv allow` again to activate changes to the .envrc file 
   or get an up-to-date shell when direnv couldn't run automatically.

3. Compile translations and CSS (look at dodo.py to see what this does):

   ```
   doit
   ```

4. Create a config file named `config.yml` using the config template from `src/ekklesia_portal/config.example.yml`.
   Under `database`, you have to change `uri`.
   Under `app`, change `force_ssl` to *false* and `insecure_development_mode` to *true*.
   The config file should look like this:

   ```
   database:
       uri: "postgresql+psycopg2:///ekklesia_portal?host=/run/postgresql"
   app:
       instance_name: my_ekklesia_portal
       insecure_development_mode: true
       login_visible: true
       force_ssl: false
   browser_session:
       secret_key: dev
       cookie_secure: false
       permanent_lifetime: 999999
   ```

5. Initialize the dev database:

   ```
   create_dev_db
   ```

   This command populates the `ekklesia_portal` database.

6. Run the development server (look at `flake.nix` to see what this does):

   ```
   run_dev
   ```

   You can use a browser, for example Firefox which is pre-installed on the VM to
   go to the application running at `http://localhost:8080`. Log in as 
   `testuser`, or `testadmin` for a privileged admin user.
7. To compile changes to stylesheets and translations automatically, run in a 
   second shell tab/window:
   ```shell
   doit_auto
   ```


## Setting up Tests

1. To set the test database connection URL {file}, open `.envrc` in an editor
   and uncomment the line with `EKKLESIA_PORTAL_TEST_DB_URL` (remove the `#`) .
   The line in the file should look like this now:
   ```
   EKKLESIA_PORTAL_TEST_DB_URL="postgresql+psycopg2:///test_ekklesia_portal?host=/run/postgresql"
   ```
   
2. Run `direnv allow` to activate changes to `.envrc`.

3. Set up test data:

   ```
   create_test_db
   ```

   This command populates the `test_ekklesia_portal` database.

4. Run all tests:

   ```
   pytest
   ```
