{
  self,
  pkgs,
  inputs,
  username,
  host,
  generated,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
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
        then [
          ./../home/default.leshy.nix
          inputs.nixvim.homeModules.nixvim
        ]
        else [
          ./../home
          inputs.nixvim.homeModules.nixvim
        ];
      home.username = "${username}";
      home.homeDirectory = "/home/${username}";
      home.stateVersion = "24.05";
      programs.home-manager.enable = true;
    };
  };

  users.users.${username} = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = ["networkmanager" "wheel" "video" "audio" "disk"];
    shell = pkgs.zsh;
  };
  nix.settings.allowed-users = ["${username}"];
}
