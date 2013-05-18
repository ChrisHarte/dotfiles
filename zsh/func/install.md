## Add to .zshrc

    # Load the zsh functions for the fancy grb prompt
    fpath=($fpath $HOME/.dotfiles/zsh/func)

    # Setup prompt
    autoload -U promptinit
    promptinit
    prompt grb

    # Colors
    autoload -U colors
    colors
    setopt prompt_subst
