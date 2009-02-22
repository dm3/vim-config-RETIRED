#!/bin/bash

# downloads the latest version of the specified script from the www.vim.org
# It would be really nice if we wouldn't need to pass in the second argument
# (name of the script), because the script download link which is
# obtained during step 3. already contains the name. I don't know how to pass it to
# the wget though (without having intermediate files and doubling step 1. and 2.).

# to use with a list of scripts do:
# while read line; do ./this_script $line; done < file_containing_scripts

url="http://www.vim.org/scripts"

if [ $# -ne 2 ]
then
    echo "need an Id (digits) and Name"
    exit -1
else
    script_id=$1
    script_name=$2
fi

# 1. wget gets the main download page of the script
# 2. awk retains all the download links (for all versions of the script)
# 3. sed retains only the first link (we use the fact that versions are sorted by date) and extracts part of the download link
# 4. xargs appends relative download path to the vim.org url (defined above) and downloads the script
wget -O - "${url}/script.php?script_id=$script_id" \
| awk '/download_script.php\?src_id=/' \
| sed -e '2,$d' -e 's/.*href="\([^"]*\)".*/\1/' \
| xargs -Ireplace wget -O ${script_name} ${url}/replace
