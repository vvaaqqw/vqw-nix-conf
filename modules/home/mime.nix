{
  lib,
  config,
  pkgs,
  ...
}: let
  addDesktop = x: "${x}.desktop";
  # take from the respective mimetype files
  images = map (_: "image/${_}") [
    "jpeg"
    "bmp"
    "gif"
    "jpg"
    "pjpeg"
    "png"
    "tiff"
    "webp"
    "x-bmp"
    "x-gray"
    "x-icb"
    "x-ico"
    "x-png"
    "x-portable-anymap"
    "x-portable-bitmap"
    "x-portable-graymap"
    "x-portable-pixmap"
    "x-xbitmap"
    "x-xpixmap"
    "x-pcx"
    "svg+xml"
    "svg+xml-compressed"
    "vnd.wap.wbmp"
    "x-icns"
    "*"
  ];
  urls = [
    "text/html"
    "x-scheme-handler/http"
    "x-scheme-handler/https"
    "x-scheme-handler/about"
    "x-scheme-handler/ftp"
    "x-scheme-handler/unknown"
    "application/x-extension-htm"
    "application/x-extension-html"
    "application/x-extension-shtml"
    "application/x-extension-xht"
    "application/x-extension-xhtml"
  ];
  readable = [
    "application/vnd.comicbook-rar"
    "application/vnd.comicbook+zip"
    "application/x-cb7"
    "application/x-cbr"
    "application/x-cbt"
    "application/x-cbz"
    "application/x-ext-cb7"
    "application/x-ext-cbr"
    "application/x-ext-cbt"
    "application/x-ext-cbz"
    "application/x-ext-djv"
    "application/x-ext-djvu"
    "image/vnd.djvu+multipage"
    "application/x-bzdvi"
    "application/x-dvi"
    "application/x-ext-dvi"
    "application/x-gzdvi"
    "application/pdf"
    "application/x-bzpdf"
    "application/x-ext-pdf"
    "application/x-gzpdf"
    "application/x-xzpdf"
    "application/postscript"
    "application/x-bzpostscript"
    "application/x-gzpostscript"
    "application/x-ext-eps"
    "application/x-ext-ps"
    "image/x-bzeps"
    "image/x-eps"
    "image/x-gzeps"
    "image/tiff"
    "application/oxps"
    "application/vnd.ms-xpsdocument"
    "application/illustrator"
  ];
  documents = map (_: "application/${_}") [
    "vnd.oasis.opendocument.text"
    "vnd.openxmlformats-officedocument.wordprocessingml.document"
    "vnd.openxmlformats-officedocument.wordprocessingml.template"
    "msword"
    "vnd.ms-word.document.macroEnabled.12"
    "vnd.ms-word.template.macroEnabled.12"
  ];
  spreadsheets = map (_: "application/vnd.${_}") [
    "openxmlformats-officedocument.spreadsheetml.sheet"
    "openxmlformats-officedocument.spreadsheetml.template"
    "ms-excel"
    "ms-excel.sheet.macroEnabled.12"
    "ms-excel.template.macroEnabled.12"
    "ms-excel.addin.macroEnabled.12"
    "ms-excel.sheet.binary.macroEnabled.12"
  ];
  slides = map (_: "application/vnd.${_}") [
    "openxmlformats-officedocument.presentationml.presentation"
    "openxmlformats-officedocument.presentationml.template"
    "openxmlformats-officedocument.presentationml.slideshow"
    "ms-powerpoint"
    "ms-powerpoint.addin.macroEnabled.12"
    "ms-powerpoint.presentation.macroEnabled.12"
    "ms-powerpoint.template.macroEnabled.12"
    "ms-powerpoint.slideshow.macroEnabled.12"
  ];
  audio = [
    "application/ogg"
    "application/x-ogg"
    "application/mxf"
    "application/sdp"
    "application/smil"
    "application/x-smil"
    "application/streamingmedia"
    "application/x-streamingmedia"
    "application/vnd.rn-realmedia"
    "application/vnd.rn-realmedia-vbr"
    "audio/aac"
    "audio/x-aac"
    "audio/vnd.dolby.heaac.1"
    "audio/vnd.dolby.heaac.2"
    "audio/aiff"
    "audio/x-aiff"
    "audio/m4a"
    "audio/x-m4a"
    "application/x-extension-m4a"
    "audio/mp1"
    "audio/x-mp1"
    "audio/mp2"
    "audio/x-mp2"
    "audio/mp3"
    "audio/x-mp3"
    "audio/mpeg"
    "audio/mpeg2"
    "audio/mpeg3"
    "audio/mpegurl"
    "audio/x-mpegurl"
    "audio/mpg"
    "audio/x-mpg"
    "audio/rn-mpeg"
    "audio/musepack"
    "audio/x-musepack"
    "audio/ogg"
    "audio/scpls"
    "audio/x-scpls"
    "audio/vnd.rn-realaudio"
    "audio/wav"
    "audio/x-pn-wav"
    "audio/x-pn-windows-pcm"
    "audio/x-realaudio"
    "audio/x-pn-realaudio"
    "audio/x-ms-wma"
    "audio/x-pls"
    "audio/x-wav"
    "audio/x-ms-asf"
    "application/vnd.ms-asf"
    "audio/x-matroska"
    "application/x-matroska"
    "audio/webm"
    "audio/vorbis"
    "audio/x-vorbis"
    "audio/x-vorbis+ogg"
    "application/x-ogm"
    "application/x-ogm-audio"
    "application/x-shorten"
    "audio/x-shorten"
    "audio/x-ape"
    "audio/x-wavpack"
    "audio/x-tta"
    "audio/AMR"
    "audio/ac3"
    "audio/eac3"
    "audio/amr-wb"
    "audio/flac"
    "audio/mp4"
    "audio/x-pn-au"
    "audio/3gpp"
    "audio/3gpp2"
    "audio/dv"
    "audio/opus"
    "audio/vnd.dts"
    "audio/vnd.dts.hd"
    "audio/x-adpcm"
    "application/x-cue"
    "audio/m3u"
    "audio/*"
  ];
  video = [
    "application/x-ogm-video"
    "application/x-mpegurl"
    "application/vnd.apple.mpegurl"
    "application/x-extension-mp4"
    "video/mpeg"
    "video/x-mpeg2"
    "video/x-mpeg3"
    "video/mp4v-es"
    "video/x-m4v"
    "video/mp4"
    "video/divx"
    "video/vnd.divx"
    "video/msvideo"
    "video/x-msvideo"
    "video/ogg"
    "video/quicktime"
    "video/vnd.rn-realvideo"
    "video/x-ms-afs"
    "video/x-ms-asf"
    "video/x-ms-wmv"
    "video/x-ms-wmx"
    "video/x-ms-wvxvideo"
    "video/x-avi"
    "video/avi"
    "video/x-flic"
    "video/fli"
    "video/x-flc"
    "video/flv"
    "video/x-flv"
    "video/x-theora"
    "video/x-theora+ogg"
    "video/x-matroska"
    "video/mkv"
    "video/webm"
    "video/x-ogm"
    "video/x-ogm+ogg"
    "video/mp2t"
    "video/vnd.mpegurl"
    "video/3gp"
    "video/3gpp"
    "video/3gpp2"
    "video/dv"
    "video/*"
  ];
  models = ["model/stl" "model/3mf"];
  cad = [
    "application/acad"
    "application/x-acad"
    "application/x-autocad"
    "application/autocad_dwg"
    "application/sld"
    "application/sldworks"
    "application/x-sld"
    "image/x-sld"
    "image/vnd.dxf"
    "application/dwg"
    "drawing/dwg"
    "application/x-dwg"
    "image/x-dwg"
    "application/dwf"
    "application/x-dwf"
    "drawing/x-dwf"
    "image/x-dwf"
    "image/vnd.dwf"
    "model/vnd.dwf"
    "image/vnd.dwg"
    "application/vnd.vectorworks"
    "model/iges"
    "application/iges"
    "application/step"
    "model/x.stl-binary"
    "model/vnd.gs-gdl"
    "model/vnd.gs.gdl"
    "model/vnd.dwfx+xps"
  ];
  archives = map (_: "application/${_}") [
    "bzip2"
    "gzip"
    "vnd.android.package-archive"
    "vnd.ms-cab-compressed"
    "vnd.debian.binary-package"
    "x-7z-compressed"
    "x-7z-compressed-tar"
    "x-ace"
    "x-alz"
    "x-ar"
    "x-archive"
    "x-arj"
    "x-brotli"
    "x-bzip-brotli-tar"
    "x-bzip"
    "x-bzip-compressed-tar"
    "x-bzip1"
    "x-bzip1-compressed-tar"
    "x-cabinet"
    "x-cd-image"
    "x-compress"
    "x-compressed-tar"
    "x-cpio"
    "x-chrome-extension"
    "x-deb"
    "x-ear"
    "x-ms-dos-executable"
    "x-gtar"
    "x-gzip"
    "x-gzpostscript"
    "x-java-archive"
    "x-lha"
    "x-lhz"
    "x-lrzip"
    "x-lrzip-compressed-tar"
    "x-lz4"
    "x-lzip"
    "x-lzip-compressed-tar"
    "x-lzma"
    "x-lzma-compressed-tar"
    "x-lzop"
    "x-lz4-compressed-tar"
    "x-ms-wim"
    "x-rar"
    "x-rar-compressed"
    "x-rpm"
    "x-source-rpm"
    "x-rzip"
    "x-rzip-compressed-tar"
    "x-tar"
    "x-tarz"
    "x-tzo"
    "x-stuffit"
    "x-war"
    "x-xar"
    "x-xz"
    "x-xz-compressed-tar"
    "x-zip"
    "x-zip-compressed"
    "x-zstd-compressed-tar"
    "x-zoo"
    "zip"
    "zstd"
  ];
  code = [
    "inode/x-empty"
    "application/x-code-workspace"
    "application/x-shellscript"
    "text/english"
    "text/plain"
    "text/x-makefile"
    "text/x-c++hdr"
    "text/x-c++src"
    "text/x-chdr"
    "text/x-csrc"
    "text/x-java"
    "text/x-moc"
    "text/x-pascal"
    "text/x-tcl"
    "text/x-tex"
    "text/x-c"
    "text/x-c++"
    "text/*"
  ];
  torrents = [
    "application/x-bittorrent"
    "x-scheme-handler/magnet"
  ];
  directories = [
    "inode/directory"
    "inode/mount-point"
  ];

  # .desktop names:
  # - /etc/profiles/per-user/kiara/share/applications/
  # - ~/.local/share/applications/
  browsers = ["chromium"];
  editors = ["neovim" "helix" "code" "lapce" "kate"];
  # MIME associations: specific items go lower left
  # (first in the inner list but late in the outer list),
  # generic ones upper-right
  # MIME types: https://www.digipres.org/formats/mime-types/
  associations = lib.mine.prioritizeList (lib.lists.map (lib.mine.mapVals (lib.lists.map addDesktop)) [
    # use pistol as fallback for terminal-based read-only previews
    (
      lib.genAttrs
      (lib.catAttrs "mime" config.programs.pistol.associations)
      (_: ["pistol"])
    )
    (lib.genAttrs code (_: editors))
    (lib.genAttrs images (_: ["qview"]))
    (lib.genAttrs urls (_: browsers))
    (lib.genAttrs readable (_: ["org.gnome.Evince"]))
    (lib.genAttrs audio (_: ["vlc" "mpv"]))
    (lib.genAttrs video (_: ["vlc" "mpv"]))
    (lib.genAttrs archives
      (_: ["unar" "org.gnome.FileRoller" "thunar"]))
    (lib.genAttrs documents (_: ["wps" "writer" "less"]))
    (lib.genAttrs spreadsheets (_: ["et" "calc" "visidata" "less"]))
    (lib.genAttrs slides (_: ["wpp" "simpress"]))
    (lib.genAttrs models (_: ["PrusaSlicer"]))
    (lib.genAttrs ["text/x-gcode"] (_: ["PrusaGcodeviewer"]))
    (lib.genAttrs cad (_: ["org.freecadweb.FreeCAD"]))
    (lib.genAttrs torrents (_: ["stremio"]))
    (lib.genAttrs directories (_: [
      "yazi"
      "thunar"
      "helix"
      "codium"
      "lapce"
      "less"
      "vlc"
    ])) # gets hijacked: https://github.com/microsoft/vscode/issues/41037#issuecomment-369339898
    {
      "x-scheme-handler/mailto" = ["thunderbird"];
      "text/calendar" = ["org.gnome.Calendar"];
      "application/pdf" = ["org.pwmt.zathura" "okular"];
      "text/plain" = ["codium" "org.gnome.TextEditor" "lapce" "less"];
      "text/markdown" = ["codium" "glow" "less"];
      "text/org" = ["codium" "less"];
      "application/epub+zip" = ["calibre-ebook-viewer" "calibre-ebook-edit"];
      "x-scheme-handler/tg" = ["telegramdesktop"];
      "application/json" = browsers;
      "text/csv" = ["calc" "visidata" "less" "org.gnome.TextEditor"];
      "application/vnd.smart.notebook" = ["less"];
      "x-scheme-handler/irc" = ["weechat"];
      "application/x-desktop" = ["exo-open"];
      "application/vnd.microsoft.portable-executable" = ["wine"];
    }
  ]);
in {
  xdg.mimeApps = {
    enable = true;
    defaultApplications = associations;
    associations.added = associations;
  };
  home.packages = with pkgs; [junction];

  home.sessionVariables = {
    # prevent wine from creating file associations
    WINEDLLOVERRIDES = "winemenubuilder.exe=d";
    EDITOR = "nvim";
    VISUAL = "nvim";
    TERMINAL = "kitty";
    LANG = "en_US.UTF-8";
  };
}
