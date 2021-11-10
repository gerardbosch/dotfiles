# Load .profile (but emulating sh to avoid bash/zsh incompatibilities):
# https://superuser.com/a/187673/684037
#
# Just a convenient way to load PATH and environment vars from a central place
emulate sh -c 'source ~/.profile'

