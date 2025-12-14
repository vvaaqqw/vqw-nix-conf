{
  config,
  pkgs,
  ...
}:
{
    imports =
    [(import ./vscode-plugins.nix)]
    ++ [(import ./vscode-settings.nix)];

  programs.vscode = {
    enable = true;
    mutableExtensionsDir = true; #Whether extensions can be installed or updated manually or by Visual Studio Code. Mutually exclusive to programs.vscode.profiles.
    # package = pkgs.vscodium;
    package = pkgs.vscode-fhs; #need fhs for codelldb
    profiles.default.enableExtensionUpdateCheck = true;
    profiles.default.enableUpdateCheck = false;
    
  };
}
