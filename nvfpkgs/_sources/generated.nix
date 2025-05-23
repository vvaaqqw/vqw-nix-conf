# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  rime-ice = {
    pname = "rime-ice";
    version = "7fab37280f1a90055007f561518c7daf59da9a09";
    src = fetchFromGitHub {
      owner = "iDvel";
      repo = "rime-ice";
      rev = "7fab37280f1a90055007f561518c7daf59da9a09";
      fetchSubmodules = false;
      sha256 = "sha256-vWjAJ7UEnuGpYVfqwLt0Cq1jzz+S+DjivQpR9QKyad8=";
    };
    date = "2025-05-19";
  };
  vesktop-theme-system24 = {
    pname = "vesktop-theme-system24";
    version = "2e662212b48d29d9e70a5304d66e8ffbc8ca4b0d";
    src = fetchFromGitHub {
      owner = "refact0r";
      repo = "system24";
      rev = "2e662212b48d29d9e70a5304d66e8ffbc8ca4b0d";
      fetchSubmodules = false;
      sha256 = "sha256-UpGHyPL+uPZi/G6uy/Vua3b1k2nxTs1HnMUnohGsgaw=";
    };
    date = "2025-05-05";
  };
  yazi-bookmarks = {
    pname = "yazi-bookmarks";
    version = "fbb7c00b6f887d5c0d78367bd4763ea8dff53459";
    src = fetchFromGitHub {
      owner = "dedukun";
      repo = "bookmarks.yazi";
      rev = "fbb7c00b6f887d5c0d78367bd4763ea8dff53459";
      fetchSubmodules = false;
      sha256 = "sha256-Ry3V29T7lij5JR68gTINXtOEgbrYPwd5zQDEa2kfpTA=";
    };
    date = "2025-05-06";
  };
  yazi-plugins = {
    pname = "yazi-plugins";
    version = "55bf6996ada3df4cbad331ce3be0c1090769fc7c";
    src = fetchFromGitHub {
      owner = "yazi-rs";
      repo = "plugins";
      rev = "55bf6996ada3df4cbad331ce3be0c1090769fc7c";
      fetchSubmodules = false;
      sha256 = "sha256-v/C+ZBrF1ghDt1SXpZcDELmHMVAqfr44iWxzUWynyRk=";
    };
    date = "2025-05-11";
  };
}
