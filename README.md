##my dotfiles

No install script (for now, perhaps later I'll write one).
Usually I clone this repo to `~/.config` and symlink all from
this directory to `~/`` (ofcourse with leading `.` ). Finally I
create symlinks for `.zshrc` and `.vimrc` from own dirs to my
home directory.

    cd ~/.config/dotfiles
    ln -s some_dir_file ~/.some_dir_file
    ln -s zsh/zshrc ~/.zshrc
    ln -s zsh/zlogin ~/.zlogin
    ln -s zsh/zshenv ~/.zshenv
    ln -s vim/vimrc ~/.vimrc
