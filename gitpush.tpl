#!/bin/bash

read -p "Do you want to run this script? (y/n) " ans
if [[ $ans = y ]] ; then
  read -p "Enter the name of the branch you want to push: " branch_name
  read -p "Enter the commit message: " commit_msg

  git add . &&
  git commit -m "$commit_msg" &&
  git push -u origin $branch_name

  if [ $? -eq 0 ]; then
    if [ "$branch_name" != "main" ]; then
      git checkout main &&
      git merge $branch_name &&
      git checkout $branch_name
    fi

    if command -v figlet > /dev/null && command -v lolcat > /dev/null; then
      figlet -c -f ~/.local/share/fonts/figlet-fonts/3d.flf DONE! | lolcat
    else
      echo -e "\033[1;35m
.　　 /＼＿_.ヘ／ヽ
　　 /　　　(＿(⌒厂ヽ
　　|　　　　　￣＼ノ
∩∩ ミ ⌒ ｏ　●　ミ
( ⊂) 乀＿＿＿＿＿ノ
\033[0m"

    fi
  else
    echo -e "\033[31mGit push failed. The script will not proceed.\033[0m"
  fi
fi

exit 0
