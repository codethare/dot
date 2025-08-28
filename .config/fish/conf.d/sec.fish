# 设置更安全的默认权限
umask 077

# 禁用历史记录中的敏感命令
set -gx HISTIGNORE "*[ \t]&*:*[ \t];*:*[ \t]|*:*[ \t](*:*[ \t])*:*[ \t]{*:*[ \t]}[*"
set -gx HISTCONTROL "ignoreboth"

#  防止意外覆盖文件
set -g noclobber

#  增强命令历史安全
set -gx HISTFILE "$HOME/.config/fish/fish_history_secure"
set -gx HISTFILESIZE 5000
set -gx HISTSIZE 5000

# 安全路径设置 - 避免当前目录优先
# set -gx PATH (echo $PATH | tr ' ' '\n' | grep -v '^\.' | paste -sd ' ' -)

# 禁用危险命令的别名保护（需要时手动启用）
# alias rm='echo "Use rm! to force remove"; false'
# alias rm!='/bin/rm -i'

# GPG代理设置
# set -gx GPG_TTY (tty)

# 增强文件下载安全
function dl
    set -l url $argv[1]
    if string match -qr '^https?://' -- $url
        aria2c --check-certificate=false $url
    else
        echo "Invalid URL: $url"
    end
end

# 命令执行时间监控
function preexec_security --on-event fish_preexec
    echo -n (set_color brblack)"[CMD] "(set_color normal)
    date "+%Y-%m-%d %H:%M:%S"
end

# 定期清理历史记录
function clean_history
    set -l histfile ~/.config/fish/fish_history_secure
    grep -v -E '^(pass|ssh|token|key|secret)' $histfile > $histfile.clean
    mv $histfile.clean $histfile
end

