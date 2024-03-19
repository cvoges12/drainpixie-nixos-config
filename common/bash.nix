{ pkgs, home-manager, ... }: {
  home-manager.users = {
    "*" = {
      programs.zoxide = {
        enable = true;
        enableBashIntegration = true;
      };

      programs.eza = {
        enable = true;
        enableBashIntegration = true;

        extraOptions = ["--group-directories-first" "--sort ext"];
      };

      programs.ripgrep = {
        enable = true;

        arguments = ["--hidden" "--smart-case"];
      };

      programs.bat = {
        enable = true;
        config = {
          theme = "ansi";
          style = "plain";
        };

        extraPackages = true;
      };

      packages.bash = {
        enable = true;
        enableCompletion = true;
        blesh = true;

        historyControl = ["ignoreboth" "erasedups"];
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
          c  = "clear";
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

          # cat / man -> bat
          cat = "bat";
          man = "batman";

          # grep -> ripgrep
          grep = "rg --color=always --hidden --smart-case";
        };
      };
    };
  };
}