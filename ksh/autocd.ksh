
# https://github.com/ksh93/ksh/issues/187#issuecomment-782729100

_do_autocd()
{
	if	(($#==1)) && ! command -v "$1" >/dev/null && [[ -d $1 ]]
	then	printf 'cd -- %q\n' "$1" >&2
		CDPATH= command cd -- "$1"
		return 2
	fi
}
trap 'eval "_do_autocd ${.sh.command}"' DEBUG
