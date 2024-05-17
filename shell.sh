# NOTE: This is intended to be compatible with zsh or bash
#
# This draws inspiration from https://effective-shell.com

# If we are not running interactively do not continue loading this file.
case $- in
    *i*) ;;
      *) return;;
esac


# set the preferred editor (to the first available editor in the array below.
preferred_editors=(nvim vim vi)
for editor in ${preferred_editors[@]}; do
    if command -v "${editor}" >/dev/null 2>&1; then
        # Note that 'VISUAL' can be a full screen terminal editor. On legacy
        # systems 'EDITOR' was normally a line mode editor but there is
        # generally no need to differentiate any more.
        VISUAL="$(command -v ${editor})"
        EDITOR="${VISUAL}"
        break
    fi
done
unset editor preferred_editors

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # do nothing!
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX - setup colors
    export CLICOLOR=1
    export LSCOLORS=GxFxCxDxBxegedabagaced
fi
