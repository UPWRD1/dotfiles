#!/usr/bin/env bash
if [ -n "$(git status --porcelain)" ]; then
  echo "Uncommitted changes detected"
  while true; do
    # -p displays the prompt string, -r prevents backslash escaping
    read -p "Do you want to proceed? (y/n) " yn -n 1 -r
    case $yn in
        [Yy]* ) echo "Proceeding..."; break;;
        [Nn]* ) echo "Exiting..."; exit;;
        * ) echo "Please answer yes or no.";;
    esac
  done
  git commit -a
  git push
else
  echo "No change since last commit"
fi

nix run .#activate
