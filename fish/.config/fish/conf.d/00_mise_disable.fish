# Mise's vendor hook checks this before running `mise activate fish`.
# The `mise` command remains available; only automatic shell activation is off.
set -gx MISE_FISH_AUTO_ACTIVATE 0
