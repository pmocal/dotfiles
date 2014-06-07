echo "Have you already cloned the desired dotfiles into the directory ~/dotfiles on this machine?"
select yn in "Yes" "No"; do
    case $yn in
        Yes )
			files="bashrc bash_profile vimrc" #desired dotfiles

			echo "Moving old dotfiles to directory ~/olddotfiles and renaming them without the leading dot"
			cd ~
			mkdir ~/olddotfiles
			for file in $files; do
				mv ~/.$file ~/olddotfiles/$file
			done

			echo "Symlinking new dotfiles, located in ~/dotfiles, to files with leading dot in root"
			cd ~/dotfiles
			for file in $files; do
				ln -s ~/dotfiles/$file ~/.$file
			done
        No )
			echo "Please do that first and then run this script."
			exit
			;;
    esac
done
