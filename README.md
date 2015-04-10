boot2docker-persist
===================

This role sets up a `boot2docker`-based machine to persist configuration and installs across reboots.  It does this by adding a `persist-autorestore.sh` to `/var/lib/boot2docker` and calling it from the local `bootsync.sh` script, and by setting up a `tce` directory on the data partition.  (To store installed packages.)

The added script simply restores the standard `mydata.tgz` from the `boot2docker-data` partition, which means that you must explicitly run the `backup` command to save your changes before a reboot.  An initial backup is created for you, saving the system's current state when the playbook is initially run.

After that, you must explicitly run the `backup` command to make backups, and manage the `/opt/.filetool.lst` yourself.  However, any packages you install via `tce-load -i` will reload themselves at boot time, and any packages downloaded via `tce-load -w` will be cached in the `/tce/optional` subdirectory of the data partition, so they don't have to be downloaded again.


Example Playbook
----------------

    - hosts: my-boot2docker-vm
      roles:
         - role: pjeby.boot2docker-persist

License
-------

MIT
