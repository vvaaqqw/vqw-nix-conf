{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  buildInputs = [
    (pkgs.texlive.combine {
      inherit
        (pkgs.texlive)
        # 基础组件
        scheme-medium
        # 额外需要的包（根据你的文档分析得出）
        ctex
        gobble
        enumitem
        geometry
        hyperref
        fontspec
        xltxtra
        ulem
        titlesec
        xcolor
        url
        l3kernel
        l3packages
        etoolbox
        pdfescape
        oberdiek
        luatex
        xetex
        latexmk
        parskip
        fontawesome5
        # 其他可能需要的包...
        ;
    })

    # 字体支持（可能需要）
    pkgs.dejavu_fonts
    pkgs.liberation_ttf
    pkgs.source-han-serif
    pkgs.wqy_zenhei
    pkgs.noto-fonts-cjk-sans
  ];
}
