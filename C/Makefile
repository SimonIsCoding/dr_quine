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
	cd ./Grace && ./Grace
	diff ./Grace/Grace.c ./Grace/Grace_kid.c

./Sully/build/Sully:		./Sully/Sully.c
	mkdir -p ./Sully/build
	$(CC) $(FLAGS) -o ./Sully/build/Sully ./Sully/Sully.c
	cd ./Sully/build && ./Sully
	@echo "diff Sully/Sully.c Sully/build/Sully_0.c"
	-@diff Sully/Sully.c Sully/build/Sully_0.c ; true
	@echo "Sully/build/Sully_3.c Sully/build/Sully_2.c"
	-@diff Sully/build/Sully_3.c Sully/build/Sully_2.c ; true

Colleen:	./Colleen/Colleen

Grace:	./Grace/Grace

Sully:	./Sully/build/Sully

fclean:
	$(RM) ./Colleen/Colleen ./Colleen/tmp_Colleen ./Grace/Grace ./Grace/Grace_kid.c ./Sully/build

re:	fclean all

.PHONY: all re fclean Colleen Grace Sully
