ocamlopt -o bin/giraph -I src src/codeStream.ml src/scanner.ml src/generator.ml src/compiler.ml
rm -rf src/**.cmi src/**.cmx src/**.o
