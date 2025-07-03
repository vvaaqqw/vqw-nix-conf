{
  self,
  pkgs,
  inputs,
  username,
  host,
  generated,
  nixxxvim,
  ...
}: {
  imports = [inputs.home-manager.nixosModules.home-manager
  nixxxvim.homeModules.nixvim
  ];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    #backupFileExtension = "hmbackup";
    backupFileExtension = "hmbackup-${builtins.substring 0 8 (builtins.toString self.lastModifiedDate)}";
    extraSpecialArgs = {inherit inputs username host generated;};
    users.${username} = {
      imports =
        if (host == "leshy")
        then [./../home/default.leshy.nix]
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
