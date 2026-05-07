CC		= clang
FLAGS	= -Wall -Wextra -Werror
RM		= rm -rf

all:	./Colleen/Colleen ./Grace/Grace ./Sully/build/Sully

./Colleen/Colleen:	./Colleen/Colleen.c
	$(CC) $(FLAGS) -o ./Colleen/Colleen ./Colleen/Colleen.c
	cd ./Colleen && ./Colleen > tmp_Colleen
	diff ./Colleen/tmp_Colleen ./Colleen/Colleen.c

./Grace/Grace:		./Grace/Grace.c
	$(CC) $(FLAGS) -o ./Grace/Grace ./Grace/Grace.c

./Sully/build/Sully:		./Sully/Sully.c
	mkdir -p ./Sully/build
	$(CC) $(FLAGS) -o ./Sully/build/Sully ./Sully/Sully.c

Colleen:	./Colleen/Colleen

fclean:
	$(RM) ./Colleen/Colleen ./Colleen/tmp_Colleen ./Grace/Grace ./Grace/Grace_kid.c ./Sully/build

re:	fclean all

.PHONY: all re fclean Colleen Grace Sully
