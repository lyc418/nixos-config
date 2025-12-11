{ ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Ethan Lai";
        email = "ethanlai@cyberangel.work";
      };
      init.defaultBranch = "main";
    };
  };
}
