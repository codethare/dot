set -gx LANG en_US.UTF-8
# 语言和安全区域设置
set -gx LANG en_US.UTF-8
set -gx LC_CTYPE en_US.UTF-8
set -gx LC_ALL en_US.UTF-8

# 安全路径设置
# set -gx PATH /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin

# 安全终端设置
set -gx TMOUT 3600 # 1小时无操作自动退出

# KVM 默认 URI
set -gx LIBVIRT_DEFAULT_URI "qemu:///system"

# vim > nvim
set -gx EDITOR nvim

set -U fish_greeting

# 添加用户目录到PATH（安全位置）
if test -d "$HOME/.local/bin"
    set -gx PATH "$HOME/.local/bin" $PATH
end

# 添加 ~/.bin 到 PATH
if test -d "$HOME/.bin"
    set -gx PATH "$HOME/.bin" $PATH
end

# 初始化目录历史变量
if not set -q dirprev
    set -g dirprev
end

if not set -q dirnext
    set -g dirnext
end

# 捕获目录变更事件
function __record_dir_history --on-variable PWD
    set -g dirprev $dirprev $OLDPWD
end
