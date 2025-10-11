{
  hostname,
  config,
  pkgs,
  lib,
  host,
  ...
}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    historySubstringSearch.enable = true;
    enableVteIntegration = true;
    history = {
      size = 10000;
      path = "$HOME/.zsh_history";
      expireDuplicatesFirst = true;
      ignoreDups = true;
      ignoreSpace = true;
      ignorePatterns = ["rm *" "pkill *" "kill *" "killall *"];
    };

    plugins = [
      {
        # Must be before plugins that wrap widgets
        # such as zsh-autosuggestions or fast-syntax-highlighting
        name = "fzf-tab";
        file = "fzf-tab.plugin.zsh";
        src = "${pkgs.zsh-fzf-tab}/share/fzf-tab";
      }
      {
        name = "nix-shell";
        file = "nix-shell.plugin.zsh";
        src = "${pkgs.zsh-nix-shell}/share/zsh-nix-shell";
      }
      {
        name = "zsh-vi-mode";
        file = "zsh-vi-mode.plugin.zsh";
        src = "${pkgs.zsh-vi-mode}/share/zsh-vi-mode";
      }
      {
        name = "zsh-autopair";
        file = "autopair.zsh";
        src = "${pkgs.zsh-autopair}/share/zsh/zsh-autopair";
      }
    ];

    oh-my-zsh = {
      enable = true;
      plugins = ["git" "gh" "rust" "safe-paste" "tailscale"];
    };
    initContent = lib.mkBefore ''
      DISABLE_AUTO_UPDATE=true
      DISABLE_MAGIC_FUNCTIONS=true
      export "MICRO_TRUECOLOR=1"
      setopt share_history
      setopt hist_expire_dups_first
      setopt hist_ignore_dups
      setopt hist_verify
      setopt correct # case correct
      # 设置补全系统对大小写不敏感
      zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
         # 彩色 ls
      if [ -x /usr/bin/dircolors ]; then
            test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
            alias ls='ls --color=auto'
      fi
      # 允许 ctrl 左右按照单词移动光标
      bindkey '^[[1;5C' forward-word # Ctrl+ right
      bindkey '^[[1;5D' backward-word # Ctrl+left
      # ctrl a e 跳转
      bindkey "^A" beginning-of-line
      bindkey "^E" end-of-line

      # Use fd (https://github.com/sharkdp/fd) for listing path candidates.
      # - The first argument to the function ($1) is the base path to start traversal
      # - See the source code (completion.{bash,zsh}) for the details.
      _fzf_compgen_path() {
        fd --hidden --exclude .git . "$1"
      }

      # Use fd to generate the list for directory completion
      _fzf_compgen_dir() {
        fd --type=d --hidden --exclude .git . "$1"
      }

      # Advanced customization of fzf options via _fzf_comprun function
      # - The first argument to the function is the name of the command.
      # - You should make sure to pass the rest of the arguments to fzf.
      _fzf_comprun() {
        local command=$1
        shift
        case "$command" in
          cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
          ssh)          fzf --preview 'dig {}'                   "$@" ;;
          *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
        esac
      }

      # using this yz shell wrapper that provides the ability to change the
      #current working directory when exiting Yazi.
      yz(){
      	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
      	yazi "$@" --cwd-file="$tmp"
      	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
      		builtin cd -- "$cwd"
      	fi
      	rm -f -- "$tmp"
      }
    '';

    shellAliases = {
      # Utils
      # fuck = "thefuck"; # hm's <programs.thefuck.alias>'s default value is this, and then thefuck has been removed
      cdt = "z ~/.local/share/Trash/files";
      cdd = "z ~/Downloads";
      cdD = "z ~/Desktop";
      cdv = "z ~/VI";
      cdw = "z ~/workspace";
      c = "clear";
      v = "nvim";
      cd = "z";
      tt = "gtrash put";
      cat = "bat";
      nano = "micro";
      #code = "codium";
      py = "python";
      icat = "kitten icat";
      dsize = "du -hs";
      pdf = "tdf";
      open = "xdg-open";
      space = "dua";
      man = "BAT_THEME='default' batman";
      lsblk = "lsblk -a --output 'NAME,LABEL,FSTYPE,SIZE,FSUSE%,RO,TYPE,MOUNTPOINTS'";
      l = "eza --icons  -a --group-directories-first -1"; #EZA_ICON_SPACING=2
      ll = "eza --icons  -a --group-directories-first -1 --no-user --long";
      tree = "eza --icons --tree --group-directories-first";
      # gocryptfs
      gcvi = "gocryptfs ~/Nutstore\\ Files/VI ~/VI";
      # discord
      discord = "vesktop --proxy-server=127.0.0.1:7890 --force-device-scale-factor=0.75 &";

      # Nixos
      cdnix = "z /etc/nixos";
      nix-listgen = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system"; #list generations
      nix-delgen = "sudo nix-env -p /nix/var/nix/profiles/system --delete-generations"; #后面接想删除的世代标号
      nix-rollback = "sudo nixos-rebuild switch --rollback";

      nix-init = "nix run github:nix-community/nix-init";
      #nurl = "nix run github:nix-community/nurl"; # installed
      nix-boot = "z /etc/nixos &&  nh os boot /etc/nixos && notify-send '❄ upd finished🫠'";
      nix-upd = "z /etc/nixos/nvfpkgs && sudo nvfetcher && z /etc/nixos && sudo nix flake update && nh os boot /etc/nixos && notify-send '❄ upd finished🫠'";
      nix-clean = "nh clean all --keep 5";
      nix-search = "nh search";
      ns = "nix-search-tv print | fzf --preview 'nix-search-tv preview {}' --scheme history";
      nix-test = "z /etc/nixos && nh os test";
      deadnix = "sudo nix run github:astro/deadnix /etc/nixos";
      deadfix = "sudo nix run github:astro/deadnix -- -e /etc/nixos";

      # lockupd = "cd /etc/nixos && sudo nix flake update && cd /etc/nixos/nvfpkgs && sudo nvfetcher && notify-send '❄ lock upd finished🫠'";
      # lockprxupd = "cd /etc/nixos && sudo proxychains4 -f /etc/nixos/misc/prx.conf nix flake update && notify-send '❄ lock upd finished🫠'";
      # nixupd = "cd /etc/nixos && sudo nixos-rebuild boot --flake .#ghostrace --option eval-cache false --show-trace && notify-send '❄ upd finished🫠'";
      # nixnlockupd = "cd /etc/nixos && sudo nix flake update && sudo nixos-rebuild boot --flake .#ghostrace --option eval-cache false --show-trace && notify-send '❄ upd finished🫠'";
      # nixnlockprxupd = "cd /etc/nixos && sudo nix flake update && sudo proxychains4 -f /etc/nixos/misc/prx.conf nixos-rebuild boot --flake .#ghostrace --option eval-cache false --show-trace && notify-send '❄ upd finished🫠'";
      nixprxupd = "z /etc/nixos/nvfpkgs && sudo proxychains4 -f /etc/nixos/misc/prx.conf nvfetcher && z /etc/nixos && sudo proxychains4 -f /etc/nixos/misc/prx.conf nix flake update && sudo proxychains4 -f /etc/nixos/misc/prx.conf nixos-rebuild boot --flake .#ghostrace --option eval-cache false --show-trace && notify-send '❄ upd finished🫠'";
      nixprxboot = "z /etc/nixos && sudo proxychains4 -f /etc/nixos/misc/prx.conf nixos-rebuild boot --flake .#ghostrace --option eval-cache false --show-trace && notify-send '❄ upd finished🫠'";

      # python
      piv = "python -m venv .venv";
      psv = "source .venv/bin/activate";
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
