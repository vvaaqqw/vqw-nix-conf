{
  description = "copid from FrostPhoenix's nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-unstable-small.url = "github:NixOS/nixpkgs/nixos-unstable-small";
    nur.url = "github:nix-community/NUR";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.4.1";
    #nixnix-flatpak 還在開發階段，所以ref=是用來固定版本的。不穩定。
    hypr-contrib.url = "github:hyprwm/contrib";
    hyprpicker.url = "github:hyprwm/hyprpicker";
    xremap-flake.url = "github:xremap/nix-flake";
    nix-gaming.url = "github:fufexan/nix-gaming";
    zen-browser = {
        url = "github:0xc000022070/zen-browser-flake";
        inputs.nixpkgs.follows = "nixpkgs";
    };
    # nixos-conf-editor.url = "github:snowfallorg/nixos-conf-editor";
    # nix-software-center.url = "github:snowfallorg/nix-software-center";

    alejandra.url = "github:kamadorueda/alejandra/3.0.0";

    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #   spicetify-nix.url = "github:gerg-l/spicetify-nix";
    #   spicetify-nix.inputs.nixpkgs.follows = "nixpkgs";
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    hyprpanel.inputs.nixpkgs.follows = "nixpkgs";

    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
    };

    # hyprland-easymotion = {
    # url = "github:zakk4223/hyprland-easymotion";
    # inputs.hyprland.follows = "hyprland";
    # };

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    nixos-hardware,
    nix-flatpak,
    fenix,
    self,
    ...
  } @ inputs: let
    username = "spectre";
    system = "x86_64-linux";
    unstable-small-pkgs = import inputs.nixos-unstable-small {inherit system;};
    unstsmallOverlay = final: prev: {
      inherit (unstable-small-pkgs) xdg-desktop-portal-hyprland swaylock-effects;
    };
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
      #overlays = [unstsmallOverlay];
      overlays = [
        fenix.overlays.default
        inputs.hyprpanel.overlay
        ];
    };

    # lib = nixpkgs.lib;
    # Extend nixpkgs.lib with custom lib and HM lib
    # Custom `./lib` will exposed as `lib.mine`
    # NOTE merge with `home-manager.lib` otherwise build will fail.
    mkLib = nixpkgs:
      nixpkgs.lib.extend
      (self: super: {mine = import ./lib {lib = self;};} // home-manager.lib);
    lib = mkLib inputs.nixpkgs;
  in {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [(import ./hosts/desktop)];
        specialArgs = {
          host = "desktop";
          inherit self inputs username;
        };
      };
      ghostrace = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          (import ./hosts/laptop)
          nix-flatpak.nixosModules.nix-flatpak
          inputs.xremap-flake.nixosModules.default
        ];
        specialArgs = {
          host = "ghostrace";
          inherit self inputs pkgs lib username;
        };
      };
      vm = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [(import ./hosts/vm)];
        specialArgs = {
          host = "vm";
          inherit self inputs username;
        };
      };
    };
  };
}
