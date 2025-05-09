# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  rime-ice = {
    pname = "rime-ice";
    version = "5322bcd86f47d18e0785cac4a5da239664b46235";
    src = fetchFromGitHub {
      owner = "iDvel";
      repo = "rime-ice";
      rev = "5322bcd86f47d18e0785cac4a5da239664b46235";
      fetchSubmodules = false;
      sha256 = "sha256-BFS/pMuUlZ6pQEITZ37hotl7YUMmU7kWoHA26L+y7Pc=";
    };
    date = "2025-05-01";
  };
  yazi-bookmarks = {
    pname = "yazi-bookmarks";
    version = "a70648a22b609113ed8fe3f940e262c57fc1195f";
    src = fetchFromGitHub {
      owner = "dedukun";
      repo = "bookmarks.yazi";
      rev = "a70648a22b609113ed8fe3f940e262c57fc1195f";
      fetchSubmodules = false;
      sha256 = "sha256-tsSSLyljSrXlsA/moiGzjACxA80vsfOCTIJQrJ83Yd0=";
    };
    date = "2025-04-16";
  };
  yazi-plugins = {
    pname = "yazi-plugins";
    version = "864a0210d9ba1e8eb925160c2e2a25342031d8d3";
    src = fetchFromGitHub {
      owner = "yazi-rs";
      repo = "plugins";
      rev = "864a0210d9ba1e8eb925160c2e2a25342031d8d3";
      fetchSubmodules = false;
      sha256 = "sha256-m3709h7/AHJAtoJ3ebDA40c77D+5dCycpecprjVqj/k=";
    };
    date = "2025-04-27";
  };
}
