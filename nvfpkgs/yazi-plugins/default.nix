{
  sources,
  lib,
  stdenvNoCC,
  ...
}:

stdenvNoCC.mkDerivation {
  inherit (sources.yazi-plugins) pname version src;

  # buildPhase = ''
  #   mv default.yaml rime_ice_suggestion.yaml
  # '';
  meta = with lib; {
    description = "yazi's official plugins";
    homepage = "https://github.com/yazi-rs/plugins";
    license = licenses.mit;
  };
}
