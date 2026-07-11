export DENO_INSTALL='/opt/deno'
[[ -f "${DENO_INSTALL}/env" ]] && source "${DENO_INSTALL}/env"
[[ -d "${DENO_INSTALL}/completions" ]] && export FPATH="${DENO_INSTALL}/completions:$FPATH"
