# To learn more about how to use Nix to configure your environment
# see: https://firebase.google.com/docs/studio/customize-workspace
{
  # Which nixpkgs channel to use.
  # channel = "stable";

  # Use https://search.nixos.org/packages to find packages
  packages = [
    pkgs.firebase-tools
  ];

  # Sets environment variables in the workspace
  env = {};
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
       "vscodevim.vim
       aaron-bond.better-comments
      anysphere.pyright
      arrterian.nix-env-selector
      arzg.sema
      bbenoist.Nix
      bmalehorn.vscode-fish
      bmewburn.vscode-intelephense-client
      bradlc.vscode-tailwindcss
      BriteSnow.vscode-toggle-quotes
      cl.eide
      cweijan.dbclient-jdbc
      cweijan.vscode-mysql-client2
      dankeboy36.vscode-arduino-api
      Dart-Code.dart-code
      dbaeumer.vscode-eslint
      denisbalber.vscode-jetbrains-sync
      DEVSENSE.composer-php-vscode
      DEVSENSE.intelli-php-vscode
      DEVSENSE.phptools-vscode
      DEVSENSE.profiler-php-vscode
      eamodio.gitlens
      EdwinKofler.vscode-hyperupcall-pack-unix
      elves.elvish
      esbenp.prettier-vscode
      formulahendry.code-runner"
       "GitHub.vscode-pull-request-github"
      "GitLab.gitlab-workflow"
      "jeff-hykin.better-shellscript-syntax"
      "jnoortheen.nix-ide"
      "kamadorueda.alejandra"
      "mads-hartmann.bash-ide-vscode"
      "mkhl.direnv"
      "ms-pyright.pyright"
      "ms-python.debugpy"
      "ms-python.python"
      "ms-toolsai.jupyter"
      "ms-toolsai.jupyter-keymap"
      "ms-toolsai.jupyter-renderers"
      "ms-toolsai.vscode-jupyter-cell-tags"
      "ms-toolsai.vscode-jupyter-slideshow"
      "ms-vscode.js-debug"
      "ms-vscode.makefile-tools"
      "pinage404.more-missing-features-extension-pack"
      "pinage404.nix-extension-pack"
      "PKief.material-icon-theme"
      "redhat.java"
      "redhat.vscode-yaml"
      "rust-lang.rust-analyzer"
      "sema4ai.sema4ai"
      "sema4ai.sema4ai-data-access"
      "Seuma.gitea-issue-and-timetracking"
      "TheNuProjectContributors.vscode-nushell-lang"
      "timonwong.shellcheck"
      "usernamehw.errorlens"
      "vadimcn.vscode-lldb"
      "vscjava.vscode-gradle"
      "vscjava.vscode-java-debug"
      "vscjava.vscode-java-dependency"
      "vscjava.vscode-java-pack"
      "vscjava.vscode-java-test"
      "vscjava.vscode-maven"
      "wayou.vscode-todo-highlight"
      "web-ide.che-devfile-ext"
      "wingrunr21.vscode-ruby"
      "wmaurer.change-case"
      "yossisa.cursor-usage"
      "zhuangtongfa.material-theme"
    ];

    # Enable previews
    previews = {
      enable = true;
      previews = {
        # web = {
        #   # Example: run "npm run dev" with PORT set to IDX's defined port for previews,
        #   # and show it in IDX's web preview panel
        #   command = ["npm" "run" "dev"];
        #   manager = "web";
        #   env = {
        #     # Environment variables to set for your server
        #     PORT = "$PORT";
        #   };
        # };
      };
    };

    # Workspace lifecycle hooks
    workspace = {
      # Runs when a workspace is first created
      onCreate = {
        # Example: install JS dependencies from NPM
        # npm-install = "npm install";
      };
      # Runs when the workspace is (re)started
      onStart = {
        # Example: start a background task to watch and re-build backend code
        # watch-backend = "npm run watch-backend";
      };
    };
  };
}
