function activate-uv-venv
    set -l venv (find $HOME/uv_venv -mindepth 1 -maxdepth 1 -type d | fzf --preview "{}/bin/python -m pip list ^| bat --style=numbers --color=always")
    if test -n "$venv"
        source "$venv/bin/activate.fish"
    else
        echo 未選取任何虛擬環境
    end
end
