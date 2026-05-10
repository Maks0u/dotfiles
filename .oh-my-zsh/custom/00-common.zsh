alias aws='snap run aws-cli.aws'
alias commit='git commit --message'
alias grep='grep --color=auto --ignore-case'
alias nn='sudo netstat -antupe'
alias uu='sudo ufw status numbered'
alias vimrc='vim ~/.vimrc'
alias zshrc='vim ~/.zshrc'

alias pdfmerge='gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=pdfwrite -dPDFSETTINGS=/default -sOutputFile=out.pdf "$@"'
pdfsplit () {
    input=$1
    shift
    pageList=$@
    gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=pdfwrite -dPDFSETTINGS=/default -sOutputFile=out.pdf -sPageList="${pageList}" "${input}"
}
