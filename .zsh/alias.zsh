alias ll='ls -alf'
alias k='kubectl'
alias calx='cal -3; curl -s https://www8.cao.go.jp/chosei/shukujitsu/syukujitsu.csv | iconv -f SHIFT-JIS -t UTF-8 | grep -E "`date -v-1m '+%Y/%-m/'`|`date '+%Y/%-m/'`|`date -v+1m '+%Y/%-m/'`"'
