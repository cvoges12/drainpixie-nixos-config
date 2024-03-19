{
  zoxide = {
    enable = true;
    enableBashIntegration = true;
  };

  eza = {
    enable = true;
    enableBashIntegration = true;

    extraOptions = [ "--group-directories-first" "--sort=ext" ];
  };

  ripgrep = {
    enable = true;

    arguments = [ "--hidden" "--smart-case" ];
  };

  bat = {
    enable = true;
    config = {
      theme = "ansi";
      style = "plain";
    };
  };

  bash = {
    enable = true;
    enableCompletion = true;
    blesh.enable = true;

    historyControl = [ "ignorespace" "erasedups" ];
    shellOptions = [
      "histappend"
      "cmdhist"
      "lithist"
      "histreedit"
      "histverify"
      "globstar"
      "direxpand"
      "cdspell"
      "checkwinsize"
      "dotglob"
      "extglob"
      "nocasematch"
    ];

    shellAliases = {
      # niceties
      c = "clear";
      cd = "z";
      mkdir = "mkdir -pv";

      # humanise output
      df = "df -h";
      du = "du -h";
      free = "free -h";
      wget = "wget -c";
      ping = "ping -c 5";

      # safety
      rm = "rm -i";
      mv = "mv -i";

      # cat -> bat
      cat = "bat";

      # grep -> ripgrep
      grep = "rg --color=always --hidden --smart-case";
    };
  };
}
