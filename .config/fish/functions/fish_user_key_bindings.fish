function fish_user_key_bindings
    bind \cr peco_select_history
    bind \cf peco_change_directory

    bind \cj 'cd ..; and commandline -f repaint'
end
