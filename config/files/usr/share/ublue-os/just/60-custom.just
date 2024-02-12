import '100-bling.just'
# Include some of your custom scripts here!

fix-groups:
    sudo usermod -aG docker $USER
    sudo usermod -aG libvirt $USER
    @echo "Logout to use docker or libvirt"
