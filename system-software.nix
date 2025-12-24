{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.android_sdk.accept_license = true;
  programs.nix-ld.enable = true;
  programs.niri = {
    enable = true;
  };
  programs.fish.enable = true;
  programs.firefox.enable = true;
  programs.nix-index.enable = true;
  programs.virt-manager.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  hardware.steam-hardware.enable = true;
  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
    gamescopeSession.enable = true;
  };
  programs.gamemode.enable = true;
  programs.noisetorch.enable = true;
  programs.obs-studio = {
    enable = true;
    enableVirtualCamera = true;
    package = (
      pkgs.obs-studio.override {
        cudaSupport = true;
      }
    );
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-pipewire-audio-capture
      obs-gstreamer
      obs-vkcapture
      obs-vaapi
    ];
  };

  virtualisation.docker = {
    enable = true;
  };
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      swtpm.enable = true;
    };
  };
  users.extraGroups.libvirtd.members = [ "ethan" ];
  virtualisation.virtualbox = {
    host = {
      enable = true;
      enableExtensionPack = true;
    };
  };
  users.extraGroups.vboxusers.members = [ "ethan" ];

  services.tuned.enable = true;
  services.upower.enable = true;
  services.printing.enable = true;
  services.desktopManager.gnome.enable = true;
  services.displayManager.gdm.enable = true;
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.login.enableGnomeKeyring = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  services.openssh.enable = true;
  services.tailscale.enable = true;
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = ["*"];
        settings = {
          main = {
            capslock = "escape";
          };
        };
      };
    };
  };
  services.logmein-hamachi.enable = true;
}
