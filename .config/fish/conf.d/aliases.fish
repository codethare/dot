# 基础命令增强
alias ls "ls -ltch --color=auto"
alias l "exa -h --icons --group-directories-first --color=always"
alias ll "l -l --time-style=long-iso"
alias lll "l -l --time-style=full-iso -s modified"
alias tree "exa --tree -alh --icons --color=always"

# Wayland 剪贴板工具
alias wlc "wl-copy -n -t text/plain"
alias yankit "yank-cli -- wl-copy -n -t text/plain"
alias recopy "wl-paste -n | wl-copy -n"
alias wlpn "wl-paste -t text/plain -n"

# 下载工具
alias dlpaste "aria2c (wl-paste -n)"
alias dlopaste "dl-open (wl-paste -n)"
alias broken-link "wl-paste -n | string replace -a '\n' '' | url-picker"

# Git 简化
alias ga "git commit -a"

# 代理设置 (根据需求启用)
# alias dxproxy "set -gx http_proxy socks5://127.0.22.19:3215; set -gx https_proxy socks5://127.0.22.19:3215"

# 安全增强别名
alias rm "rm -I --preserve-root"  # 安全删除
alias chmod "chmod --preserve-root"
alias chown "chown --preserve-root"
alias chgrp "chgrp --preserve-root"

# 添加安全确认
alias mv "mv -i"
alias cp "cp -i"
alias ln "ln -i"

# 文件操作审计
alias delfile "rm -vI --preserve-root"
alias movefile "mv -v"
alias copyfile "cp -v"

# create machine-id
alias machine-id "echo 'dbus-machine-id-$(uuidgen)'"


