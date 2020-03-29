# echo test netty 1000
# time for ((i=1;i<=1000;i++)); do curl -s -x socks5h://localhost:1081 http://webapp/4k.jpg >/dev/null; done

# echo test rust 1000
# time for ((i=1;i<=1000;i++)); do curl -s -x socks5h://localhost:1082 http://webapp/4k.jpg >/dev/null; done


netty_test(){
    curl -s -x socks5h://localhost:1081 http://webapp/4k.jpg >/dev/null
}

rust_test(){
    curl -s -x socks5h://localhost:1082 http://webapp/4k.jpg >/dev/null
}
export -f netty_test
export -f rust_test
echo test netty 1000 with 10 threads
time seq 1000 | parallel -j10 netty_test

echo test rust 1000 with 10 threads
time seq 1000 | parallel -j10 rust_test