{ pkgs, ... }: {
  home.activation.cloneRepos = lib.hm.dag.entryAfter [ "installPackages" ]
    (builtins.readFile ./clone_repos.sh);
}
