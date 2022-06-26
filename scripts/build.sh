ocamllex -o src/lexyacc/lexer.ml src/lexyacc/definitions/lexer.mll
ocamlyacc -b src/lexyacc/parser src/lexyacc/definitions/parser.mly

cd src/lexyacc
ocamlc -c parser.mli
ocamlc -c lexer.ml
ocamlc -c parser.ml
ocamlc -c calc.ml
ocamlc -o ../../bin/giraph lexer.cmo parser.cmo calc.cmo

cd ../..
rm -rf src/lexyacc/**.cmi src/lexyacc/**.cmx src/lexyacc/**.cmo
