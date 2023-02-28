#!/bin/bash
read -p "Are you sure you want to run this script? (y/n) " -n 1 -r
echo 
if [[ $REPLY =~ ^[Yy]$ ]]
then
  branch=$(git rev-parse --abbrev-ref HEAD)

  git add . &&
  git commit -m "Auto Push" &&
  git push -f origin $branch

  if [ $? -eq 0 ]; then
    if [ "$branch" != "main" ]; then
      git checkout main &&
      git merge $branch &&
      git checkout dev
    fi

    if command -v figlet > /dev/null && command -v lolcat > /dev/null; then
      figlet -c -f ~/.local/share/fonts/figlet-fonts/3d.flf DONE! | lolcat
    else
      echo "
.　　 /＼＿_.ヘ／ヽ
　　 /　　　(＿(⌒厂ヽ
　　|　　　　　￣＼ノ
∩∩ ミ ⌒ ｏ　●　ミ
( ⊂) 乀＿＿＿＿＿ノ
"
    fi
  else
    # Git push failed
    echo "Git push failed. The script will not proceed."
  fi
fi

exit 0
