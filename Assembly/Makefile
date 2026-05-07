#Variables
COMP	= nasm
FLAGS	= -f elf64
GCC		= gcc
RM		= rm -rf

#Rules
all: ./Colleen/Colleen ./Grace/Grace ./Sully/Sully

./Colleen/Colleen:
	$(COMP) $(FLAGS) ./Colleen/Colleen.s -o ./Colleen/Colleen.o
	$(GCC) ./Colleen/Colleen.o -o ./Colleen/Colleen
	./Colleen/Colleen > ./Colleen/tmp_Colleen
	diff ./Colleen/tmp_Colleen ./Colleen/Colleen.s

./Grace/Grace:
	$(COMP) $(FLAGS) ./Grace/Grace.s -o ./Grace/Grace.o
	$(GCC) ./Grace/Grace.o -o ./Grace/Grace
	cd Grace && ./Grace
	diff ./Grace/Grace_kid.s ./Grace/Grace.s

./Sully/Sully:
	mkdir -p ./Sully/build
	$(COMP) $(FLAGS) ./Sully/Sully.s -o ./Sully/build/Sully.o
	$(GCC) ./Sully/build/Sully.o -o ./Sully/build/Sully
	cd Sully/build && ./Sully
	@echo "diff Sully/Sully.s Sully/build/Sully_0.s"
	-@diff Sully/Sully.s Sully/build/Sully_0.s ; true
	@echo "Sully/build/Sully_3.s Sully/build/Sully_2.s"
	-@diff Sully/build/Sully_3.s Sully/build/Sully_2.s ; true

Colleen: ./Colleen/Colleen

Grace: ./Grace/Grace

Sully: ./Sully/Sully

fclean:
	$(RM) ./Colleen/Colleen.o ./Colleen/Colleen ./Colleen/tmp_Colleen
	$(RM) ./Grace/Grace ./Grace/Grace_kid.s ./Grace/Grace.o
	$(RM) ./Sully/build

re: fclean all

.PHONY:	fclean re all Colleen Grace Sully
