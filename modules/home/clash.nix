{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = [
    pkgs.clash-meta
    pkgs.clash-verge
  ];
}
