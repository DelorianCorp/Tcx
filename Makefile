#GPL-2 License

CC = gcc
LEX = flex
CFLAGS = 
LFLAGS = 
IN = Tcx
OUT = tcx

all: dep
	$(CC) $(LFLAGS) lex.yy.c -o $(OUT)

dep: $(IN).l
	flex $<

install:
	sudo cp $(OUT) /usr/bin/$(OUT)

clean:
	rm -f *.yy.c

cleanAll:
	rm -f *.yy.c $(BIN)
