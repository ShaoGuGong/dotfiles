export def main [] {
    # 取得 ~/.ssh/config 裡所有 Host
    let servers = (
        open ~/.ssh/config
        | lines
        | where { |line| $line | str starts-with 'Host ' }
        | each { |line| $line | split row ' ' | get 1 }
        | to text
    )
    # 用 fzf 選擇 server
    let server = ($servers | fzf)
    if ($server == "") {
        print (ansi red_bold) + "No server selected" + (ansi reset)
        return
    }
    ssh $server
}
