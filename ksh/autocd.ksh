
# https://github.com/ksh93/ksh/issues/196#issuecomment-786960009

_do_autocd()
{
        if      (($#==1)) && ! command -v "$1" >/dev/null && [[ -d $1 ]]
        then    printf 'cd -- %q\n' "$1" >&2
                CDPATH= command cd -- "$1"
                return 2
        fi
}
trap '((!.sh.level)) && [[ $1 != \(* && -o interactive ]] && eval "_do_autocd ${.sh.command}"' DEBUG
