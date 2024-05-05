pkgs: pkgs.writeShellApplication {
  name = "update-deps-pr";

  runtimeInputs = with pkgs; [ gh coreutils git nix ];

  text = ''
    function yes_or_no {
      while true; do
          read -r -p "$* [y/n]: " yn
          case $yn in
              [Yy]*) return 0  ;;  
              [Nn]*) echo "Aborted" ; return  1 ;;
          esac
      done
    }

    printf "\n----- step 1 of 1 -----\n\n"
    printf "this will update the nix flake lock file and opens a pr using github CLI.\n"
    yes_or_no "continue?"

    if [ -z "$(git status --porcelain)" ]; then 
      DATE=$(date --iso-8601)
      echo "$DATE"
      BRANCH="update-deps-$DATE"
      git checkout -b "$BRANCH"
      GIT_LFS_SKIP_SMUDGE=1 nix flake update
      git add -A
      git commit -m "chore: update deps $DATE" -m "(generated using https://github.com/sempruijs/tools)"
      git push -u origin "$BRANCH"

      echo -e "Update deps by running \`nix flake update\`\n\n*(This PR is generated using [update-deps-pr](https://github.com/cor/update-deps-pr))*" > git-commit-msg
      MSG=$(cat git-commit-msg)
      export MSG
      gh pr create -t "Update deps ($DATE)" -b "$MSG"
      rm git-commit-msg
    else 
      echo "Please make sure that your working directory is clean and try again."
    fi
  '';
}
