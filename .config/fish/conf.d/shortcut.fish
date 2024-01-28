#___________________________________________
#                                   shortcut
alias ls "ls -ltch --color=auto"

if type -q exa
  alias l "exa -h --icons --group-directories-first --color=always"
  alias ll "l -l --time-style=long-iso"
  alias lll "l -l --time-style=full-iso -s modified"
  alias la "l -a"
  alias lla "ll -a"
  alias lls "ll -s size"
  alias llas "lla -s size"
  alias llla "lll -a"
  alias tree "exa --tree -alh --icons --color=always"
end

alias .. "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."
alias ..... "cd ../../../.."

# Improve du, df
alias du "du -h"
alias df "df -h"

# Improve od for hexdump
alias od "od -Ax -tx1z"
alias hexdump "hexdump -C"

alias g "git"
alias px "proxychians"

alias dxproxy "export http_proxy=socks5://127.0.91.55:5123 && export https_proxy=socks5://127.0.91.55:5123"

alias ":q" "exit"
