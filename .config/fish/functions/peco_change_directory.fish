function _peco_change_directory
    if set -q argv[1]
        peco --layout=bottom-up --query "$argv[1]" | perl -pe 's/([ ()])/\\$1/g' | read foo
    else
        peco --layout=bottom-up | perl -pe 's/([ ()])/\\$1/g' | read foo
    end
    if set -q foo && test -n "$foo"
        builtin cd $foo
        commandline -r ''
        commandline -f repaint
    else
        commandline ''
    end
end

function peco_change_directory
    begin
        echo $HOME/.config
        # ghq list -p
        ls -ad */ | perl -pe "s#^#$PWD/#" | grep -v \.git
        ls -ad $HOME/build/project/*/* | grep -v \.git
    end | sed -e 's/\/$//' | awk '!a[$0]++' | _peco_change_directory $argv
end
