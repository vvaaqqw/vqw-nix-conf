# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  rime-ice = {
    pname = "rime-ice";
    version = "5b94b7df626bffedc3fe05ee71511aa0272bfc36";
    src = fetchFromGitHub {
      owner = "iDvel";
      repo = "rime-ice";
      rev = "5b94b7df626bffedc3fe05ee71511aa0272bfc36";
      fetchSubmodules = false;
      sha256 = "sha256-RK5togo9YEQVSUL1bpkcsHmzK1V8IMe0adFB1T2hVoI=";
    };
    date = "2025-06-09";
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
  yazi-compress = {
    pname = "yazi-compress";
    version = "9fc8fe0bd82e564f50eb98b95941118e7f681dc8";
    src = fetchFromGitHub {
      owner = "KKV9";
      repo = "compress.yazi";
      rev = "9fc8fe0bd82e564f50eb98b95941118e7f681dc8";
      fetchSubmodules = false;
      sha256 = "sha256-VKo4HmNp5LzOlOr+SwUXGx3WsLRUVTxE7RI7kIRKoVs=";
    };
    date = "2025-06-02";
  };
  yazi-plugins = {
    pname = "yazi-plugins";
    version = "63f9650e522336e0010261dcd0ffb0bf114cf912";
    src = fetchFromGitHub {
      owner = "yazi-rs";
      repo = "plugins";
      rev = "63f9650e522336e0010261dcd0ffb0bf114cf912";
      fetchSubmodules = false;
      sha256 = "sha256-ZCLJ6BjMAj64/zM606qxnmzl2la4dvO/F5QFicBEYfU=";
    };
    date = "2025-05-31";
  };
}
