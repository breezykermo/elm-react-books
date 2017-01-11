COREFILES = Defs.ml Renderers.ml Util.ml

all: imp1.d.byte test

test: $(COREFILES) test.ml
	ocamlbuild -use-ocamlfind -pkg core test.d.byte

imp1.d.byte: $(COREFILES) imp1.ml
	ocamlbuild -use-ocamlfind -pkg core imp1.d.byte
