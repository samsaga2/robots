all: clean compile run

clean:
	rm -f robots.rom src/main.lst src/main.sym

compile:
	cd src; sjasm -s main.asm ../robots.rom

res:
	python3 scripts/screen.py resources/logo1.png src/logo1
	python3 scripts/screen.py resources/logo2.png src/logo2
	python3 scripts/screen.py resources/logo3.png src/logo3
	python3 scripts/screen.py resources/logo4.png src/logo4
	python3 scripts/screen.py resources/logofinal.png src/logofinal
	python3 scripts/screen.py resources/game.png src/game

run:
	openmsx -carta robots.rom
