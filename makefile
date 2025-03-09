kokb: kokb.l
	flex kokb.l
	gcc -o kokb lex.yy.c -lfl

clean:
	rm -f kokb lex.yy.c