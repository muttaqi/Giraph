for f in src/*.ml; do
    echo $f
    ocamlformat -i --profile 'janestreet' $f
done
