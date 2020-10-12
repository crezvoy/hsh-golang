#! /bin/sh

# this script is called after each git command, after 
# the 'bundle' and 'remove' command which have no git equivalent, and after the
# extraction of a bundle.
# The following environment variables are set:
#     - HSH_ROOT: current hsh root;
#     - HSH_REPOSITORY: current repository name;
#     - HSH_ACTION: current git or hsh action, for "bundle" command, HSH_ACTION
#       is set to 'bundle-in', when extracting a bundle the action is set to
#       'bundle-out'.
# Additionally, for bundle-in and bundle-out actions the HSH_BUNDLE_ROOT is set
# to the bundle content root.
case "$HSH_ACTION"; in
    clone|bundle-out)
        [ -d "$HSH_ROOT/.local/share/golang" ] || mkdir -p "$HSH_ROOT/.local/share/golang"
        wget -o go.tar.gz "https://dl.google.com/go/$(curl https://golang.org/VERSION?m=text).linux-amd64.tar.gz"
        tar -x -f go.tar.gz -C "$HSH_ROOT/.local/share/golang" --strip-components=1
        ;;
esac
