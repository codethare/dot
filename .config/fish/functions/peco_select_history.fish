function peco_select_history
    if set -q argv[1]
        set peco_flags --layout=bottom-up --query "$argv[1]"
    else
        set peco_flags --layout=bottom-up
    end

    history | peco $peco_flags | read foo

    if set -q foo && test -n "$foo"
        commandline $foo
    else
        commandline ''
    end
end
