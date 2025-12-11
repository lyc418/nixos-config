{ ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_key_bindings fish_default_key_bindings

      function ssh
        TERM=xterm-256color command ssh $argv
      end

      function vf
        set -l targetfile (fd --type f | fzf)
        if test -n "$targetfile"
          vim $targetfile
        end
      end

      starship init fish | source
    '';
  };

  programs.nix-index = {
    enable = true;
    enableFishIntegration = true;
  };
}
