pkgs: pkgs.writeShellApplication {
  name = "update-deps-pr";

  runtimeInputs = with pkgs; [ gh coreutils git nix ];

  text = ''
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
