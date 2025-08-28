if not status is-interactive
    exit
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
set LOCAL_PLUGINS $HOME/.config/fish/plugins

if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end
