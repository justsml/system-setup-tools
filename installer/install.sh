read -r -p "Are you sure you want to install VI? [y/N]" installVI
case $installVI in
  [yY][eE][sS]|[yY])
    sh -e ../modules/vim.sh
    ;;
  *)
    printf "Skipped VI Install\n"
    ;;
esac

read -r -p "Are you sure you want to install Oh-My-ZSH? [y/N]" installZSH
case $installZSH in
  [yY][eE][sS]|[yY])
    sh -e ../modules/zsh.sh
    ;;
  *)
    printf "Skipped ZSH Install\n"
    ;;
esac

