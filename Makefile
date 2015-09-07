all: clean compile run

clean:
	rm -f src/rom.out src/rom.lst src/rom.sym

compile:
	cd src; sjasm -s rom.asm

res:
	python3 scripts/screen.py resources/logo.png src/logo
	python3 scripts/screen.py resources/logo2.png src/logo2
	python3 scripts/screen.py resources/logo3.png src/logo3
	python3 scripts/screen.py resources/game.png src/game

run:
	openmsx -carta src/rom.out
