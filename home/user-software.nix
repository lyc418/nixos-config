{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nixpkgs-fmt
    coreutils-full
    file
    wl-clipboard
    xwayland-satellite
    grim
    slurp
    hyprshot
    hyprpaper
    swaybg
    krita
    nwg-displays
    nautilus
    bottles
    pavucontrol

    alacritty
    starship
    zellij
    tmux
    ripgrep
    nil
    fzf
    fd
    tree
    emacs
    clang-tools
    cmake
    zig
    zls
    p7zip
    zip
    unzip
    yazi
    zed-editor

    fastfetch
    htop
    nvtopPackages.full
    usbutils

    gcc
    gdb
    gnumake
    cmake
    nodejs
    python3
    radare2
    lazygit
    gh

    marksman
    shellcheck
    shfmt

    asm-lsp
    awk-language-server
    cmake-language-server
    dockerfile-language-server
    docker-compose
    docker-compose-language-service
    fish-lsp
    gopls
    haskell-language-server
    hyprls
    intelephense
    jdt-language-server
    kotlin-language-server
    lua-language-server
    mesonlsp
    nodePackages.bash-language-server
    ty
    perlnavigator
    rust-analyzer
    R
    ruby-lsp
    systemd-language-server
    systemd-lsp
    taplo
    texlab
    tinymist
    typescript-language-server
    vhdl-ls
    yaml-language-server
    pyright
    verible

    libreoffice-qt6-fresh
    maestral-gui maestral
    zotero
    obsidian
    zathura
    pandoc
    hugo
    typst

    google-chrome
    microsoft-edge
    tor-browser
    discord
    telegram-desktop

    quickemu

    android-studio
    jetbrains.jdk

    claude-code
    (ollama.override {
        acceleration = "cuda";
    })

    gamescope
    steam-run
    heroic
    lutris
    protonup-qt
    (wineWowPackages.full.override {
      wineRelease = "staging";
      mingwSupport = true;
    })
    winetricks
    prismlauncher
    haguichi
    mangohud
  ];

  programs.aerc.enable = true;
  programs.btop = {
    enable = true;
    settings = {
      vim_keys = true;
    };
  };
  programs.mpv.enable = true;
  programs.rofi.enable = true;
  programs.helix = {
    enable = true;
    settings = {
      editor = {
        middle-click-paste = false;
        line-number = "relative";
        cursorline = true;
        bufferline = "multiple";
        cursor-shape = {
          insert = "bar";
        };
        soft-wrap = {
          enable = true;
        };
      };
    };
  };
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
  gtk = {
    enable = true;
    theme = {
      name = "catppuccin-mocha-mauve-standard";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "mauve" ];
        size = "standard";
        variant = "mocha";
      };
    };
  };
  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "mauve";
    aerc.enable = true;
    btop.enable = true;
    gtk = {
      icon.enable = true;
    };
    mpv.enable = true;
    rofi.enable = true;
    helix.enable = true;
    zathura.enable = true;
  };

  services.syncthing.enable = true;
}
