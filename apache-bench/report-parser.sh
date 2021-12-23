# input is the output of apache-bench
input="$1"
status_code="$2"

count="$(echo "$input" | grep -c "HTTP/1.1 "$status_code"")"

printf ""$count" responses returned status code of "$status_code""
