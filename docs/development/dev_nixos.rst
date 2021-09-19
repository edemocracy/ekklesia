.. _dev-nixos-virtualbox:

***********************
NixOS Virtualbox Dev VM
***********************

You can use the official NixOS VirtualBox appliance on your dev machine if you want to run the project
on our preferred production system NixOS. If you want to develop on another system, please look at
:ref:`quickstart`


The following code snippets are written for *ekklesia-portal* but
also work for *ekklesia-voting* when you change the project name.

1. Get the `NixOS 21.05 VirtualBox appliance <https://nixos.org/download.html#nixos-virtualbox>`_
   and follow the instructions there to import and start the VM.
2. In the VM, open :command:`konsole` and run the following commands as the demo user.
3. Add the *edemocracy* binary cache::

    # password for sudo is `demo`
    nix-shell -p cachix --run "sudo cachix use edemocracy"
    # ignore the instructions shown by cachix, we do that later.

4. Edit :file:`/etc/nixos/configuration.nix` (using `sudo nano /etc/nixos/configuration.nix`, for example) and change the `imports` line to::

    # no commas between list items in Nix!
    imports = [
      <nixpkgs/nixos/modules/installer/virtualbox-demo.nix>
      ./ekklesia_dev.nix
    ];

5. Download our :download:`recommended NixOS configuration <./ekklesia_dev.nix>`
   and put it in :file:`/etc/nixos`::

    curl -O https://raw.githubusercontent.com/edemocracy/ekklesia/master/docs/development/ekklesia_dev.nix
    sudo mv ekklesia_dev.nix /etc/nixos

6. Rebuild the NixOS system to activate our configuration::

    sudo nixos-rebuild switch

7. Tell `direnv <https://direnv.net>`_ where `nix-direnv <https://github.com/nix-community/nix-direnv>`_ is located::

    echo "source /run/current-system/sw/share/nix-direnv/direnvrc" > ~/.direnvrc

8. Clone the repository and change to the checked out directory::

    git clone https://github.com/edemocracy/ekklesia-portal
    cd ekklesia-portal

9. Tell `direnv` to use `nix-direnv` whenever you enter the directory.
   `nix-direnv` starts building immediately which may take a while::

    echo "use nix" > .envrc
    direnv allow
    # direnv runs nix-build now

10. Compile translations and CSS::

    ipython makebabel.ipy compile
    sassc -I $SASS_PATH src/ekklesia_portal/sass/portal.sass \
        src/ekklesia_portal/static/css/portal.css


11. Create a config file named ``config.yml`` using the config template
   from ``src/ekklesia_portal/config.example.yml``. Under database, you have to change ``uri``. The section should look like this::

    database:
        uri: "postgresql+psycopg2:///ekklesia_portal?host=/run/postgresql"
        fts_language: 'english'


12. Initialize the dev database with a custom config file::

    python tests/create_test_db.py -c config.yml


13. The development server can be run with a custom config file by
   executing::

    python src/ekklesia_portal/runserver.py –debug -c config.yml 2>&1 | eliot-tree -l0
