
# https://github.com/ksh93/ksh/issues/187#issuecomment-782711715

_do_autocd()
{
	if	! command -v "$1" >/dev/null && [[ -d $1 ]]
	then	print -r "cd --$(printf ' %q' "$@")"
		CDPATH= command cd -- "$@"
		return 2
	fi
}
trap 'eval "_do_autocd ${.sh.command}"' DEBUG
