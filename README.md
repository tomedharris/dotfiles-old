# Tomeh Dotfiles

## Tmux

The following line may be needed in .bashrc to make colors work correctly in vim: `export TERM=xterm-256color`

To launch tmux on starting bash, add the following to .bashrc

```
case $- in *i*)
    [ -z "$TMUX" ] && exec tmux
esac

```
