{
  sources,
  lib,
  stdenvNoCC,
  ...
}:

stdenvNoCC.mkDerivation {
  inherit (sources.yazi-plugins) pname version src;
  meta = with lib; {
    description = "A Yazi plugin that adds the basic functionality of vi-like marks";
    homepage = "https://github.com/dedukun/bookmarks.yazi";
    license = licenses.mit;
  };
}
