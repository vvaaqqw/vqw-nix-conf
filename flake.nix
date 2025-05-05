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
    self,
    nixpkgs,
    home-manager,
    nur,
    nixos-hardware,
    nix-flatpak,
    fenix,
    ...
  } @ inputs: let
    username = "spectre";
    system = "x86_64-linux";
    generated = import ./nvfpkgs/_sources/generated.nix {  # 关键：传递参数
      inherit (pkgs) fetchgit fetchurl fetchFromGitHub dockerTools;
      # 其他参数根据实际需要传递（如 fetchgit, dockerTools）
    };
    selfPkgs = import ./nvfpkgs;
    packages.x86_64-linux.default = fenix.packages.x86_64-linux.minimal.toolchain;
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style; #https://github.com/NixOS/nixfmt 用来 nix fmt, could also use "alejandra ." to do the fmt
    unstable-small-pkgs = import inputs.nixos-unstable-small {inherit system;};
    unstsmallOverlay = final: prev: {
      inherit (unstable-small-pkgs) xdg-desktop-portal-hyprland swaylock-effects;
    };
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
      #overlays = [unstsmallOverlay];
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
      cosmicrace = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          (import ./hosts/cosmicrace)
          { nixpkgs.overlays = [ selfPkgs.overlay fenix.overlays.default ]; }
          nix-flatpak.nixosModules.nix-flatpak
          inputs.xremap-flake.nixosModules.default
          # Adds the NUR overlay
          nur.modules.nixos.default
          ];
        specialArgs = {
          host = "cosmicrace";
          inherit self inputs lib username generated;
        };
      };
      ghostrace = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          (import ./hosts/ghostrace)
          { nixpkgs.overlays = [ selfPkgs.overlay fenix.overlays.default]; }
          nix-flatpak.nixosModules.nix-flatpak
          inputs.xremap-flake.nixosModules.default
          # Adds the NUR overlay
          nur.modules.nixos.default
        ];
        specialArgs = {
          host = "ghostrace";
          inherit self inputs lib username generated;
        };
      };
      # vm = nixpkgs.lib.nixosSystem {
      #   inherit system;
      #   modules = [(import ./hosts/vm)];
      #   specialArgs = {
      #     host = "vm";
      #     inherit self inputs username;
      #   };
      # };
    };

    # 用来nix develop，在一台新电脑上配置的时候用得到
    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [
        just
        helix
        nh
        age
        sops
        nvfetcher
      ];
    };
  };
}
