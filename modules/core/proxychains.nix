{
  config,
  pkgs,
  ...
}: {
  programs.proxychains = {
    enable = true;
    quietMode = false;
    proxyDNS = true;
    package = pkgs.proxychains;
    proxies.prx1 = {
      type = "http";
      host = "127.0.0.1";
      port = "7890";
    };

    proxies.prx2 = {
      type = "socks5";
      host = "127.0.0.1";
      port = "7890";
    };
    proxies.tor = {
      type = "http";
      host = "127.0.0.1";
      port = "9050";
    };
  };
}
