{
  self,
  pkgs,
  inputs,
  username,
  host,
  ...
}: {
  imports = [inputs.home-manager.nixosModules.home-manager];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    #backupFileExtension = "hmbackup";
    backupFileExtension = "hmbackup-${builtins.substring 0 8 (builtins.toString self.lastModifiedDate)}";
    extraSpecialArgs = {inherit inputs username host;};
    users.${username} = {
      imports =
        if (host == "cosmicrace")
        then [./../home/default.cosmicrace.nix]
        else [./../home];
      home.username = "${username}";
      home.homeDirectory = "/home/${username}";
      home.stateVersion = "24.05";
      programs.home-manager.enable = true;
    };
  };

  users.users.${username} = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs.zsh;
  };
  nix.settings.allowed-users = ["${username}"];
}
