set fish_greeting ""
set -gx TERM xterm-256color
umask 077

#___________________________________________
#                                     export
set -gx EDITOR nvim
# set -gx PATH node_modules/.bin $PATH
# set -gx PATH $HOME/.config/yarn/global/node_modules/.bin $PATH
set -gx fish_runtime_path /usr/bin/fish
set -Ux GEMINI_API_KEY AIzaSyDXGvQ7NODj6C93BAkHeRlIk3bh60_PMkg

set -x mv
set -x cp
set -x mkdir

set -x FZF_DEFAULT_COMMAND 'fd --type f --follow --exclude .git' # fzf: find >> fd

#___________________________________________
#                                     theme
set -g theme_display_user no
set -g theme_hide_hostname no
# set -g theme_hostname always


command -qv nvim && alias vim nvim

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
set LOCAL_PLUGINS $HOME/.config/fish/plugins

if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end
