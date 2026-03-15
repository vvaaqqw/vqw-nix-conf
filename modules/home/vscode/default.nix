{
  config,
  pkgs,
  ...
}:
{
  # giving up manage vscode with nix
    # imports =
    # [(import ./vscode-plugins.nix)]
    # ++ [(import ./vscode-settings.nix)];

  programs.vscode = {
    enable = true;
    # package = pkgs.vscodium;
    # package = pkgs.vscode-fhs; #need fhs for codelldb

    # Adding extension-specific dependencies, these will be added to the FHS environment: 
    # needed for rust lang server and rust-analyzer extension
    package = pkgs.vscode.fhsWithPackages (ps: with ps; [ rustup zlib openssl.dev pkg-config ]);
    # mutableExtensionsDir = true; #Whether extensions can be installed or updated manually or by Visual Studio Code. Mutually exclusive to programs.vscode.profiles.
  };
}
