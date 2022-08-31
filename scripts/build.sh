ocamllex -o src/lexer.ml src/definitions/lexer.mll
ocamlyacc -b src/parser src/definitions/parser.mly

cd src
ocamlc -c parser.mli
ocamlc -c lexer.ml
ocamlc -c parser.ml
ocamlc -c giraph.ml
ocamlc -o ../bin/giraph lexer.cmo parser.cmo giraph.cmo

cd ..
rm -rf src/**.cmi src/**.cmx src/**.cmo
