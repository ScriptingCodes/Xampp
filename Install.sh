#!/bin/sh
# set -x

current_version="7.2.33"
[ -z "$1" ] && latest_version=${current_version} || latest_version=$1 
url="https://www.apachefriends.org/xampp-files/${latest_version}/xampp-linux-x64-${latest_version}-1-installer.run"

echo "Downloading and installing Xargs.."

function download {
    url=$1

    if [ -x "$(which wget)" ] ; then
        echo "Installing via wget.."
        sh -c "$(wget -O- ${url})"
    elif [ -x "$(which curl)" ]; then
       echo "Installing via curl.."
       sh -c "$(curl -fsSL ${url})"
    else
        printf "Could not find curl or wget, please install one." >&2
        exit 1
    fi
}

download ${url}
exit 0