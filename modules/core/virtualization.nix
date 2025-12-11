{
  config,
  pkgs,
  username,
  ...
}: {
  # Add user to podman libvirtd group
  users.users.${username}.extraGroups = ["podman" "libvirtd" "kvm" "qemu-libvirtd"];

  # Install necessary packages
  environment.systemPackages = with pkgs; [
    distrobox # with podman
    boxbuddy # distrobox gui
    virt-manager
    virt-viewer
    spice
    spice-gtk
    spice-protocol
    virtio-win
    win-spice
    adwaita-icon-theme
  ];

  # Manage the virtualisation services
  services.spice-vdagentd.enable = true;

  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        # runAsRoot = true; # 使用系统级 qemu:///system
        swtpm.enable = true;
      };
    };
    spiceUSBRedirection.enable = true;

    #podman for distrobox
    podman = {
      enable = true;
      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;
      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };
  };
}
