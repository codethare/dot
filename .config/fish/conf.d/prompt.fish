# 自定义提示符
function fish_prompt
    # 根用户使用 #，普通用户使用 $
    set -l user_char '$'
    if test (id -u) -eq 0
        set user_char '#'
    end

    # 两行提示符：用户@主机 当前目录(短路径)
    # 第二行是 $ 或 #
    printf '%s@%s:%s\n%s ' (whoami) (hostname|cut -d . -f1) \
        (prompt_pwd) $user_char
end

function fish_prompt
    # 颜色定义 - 使用舒适的深灰色
    set -l bg_gray (set_color -b 238) # #444444
    set -l bg_dark_gray (set_color -b 236) # #303030
    set -l fg_white (set_color -o white)
    set -l fg_yellow (set_color -o yellow)
    set -l fg_green (set_color -o green)
    set -l fg_red (set_color -o red)
    set -l normal (set_color normal)

    # 用户状态
    set -l user_char '$'
    set -l user_color $fg_green
    if test "$USER" = root
        set user_char '#'
        set user_color $fg_red
    end

    # 主机名处理（安全方式）
    set -l hostname_part ""
    if set -q hostname
        set hostname_part (string split '.' -f1 -- $hostname)
    else if command -q hostname
        set hostname_part (hostname | string split '.' -f1)
    else
        set hostname_part unknown
    end

    # 当前目录
    set -l cwd (prompt_pwd)

    # 构建提示符
    # 第一行：用户@主机
    echo -n -s $bg_dark_gray $fg_white " $USER@$hostname_part " $normal

    # 第二行：当前目录
    echo -n -s $bg_gray $fg_yellow " $cwd " $normal
    echo

    # 第三行：提示符字符
    echo -n -s $user_color $user_char " " $normal
end
