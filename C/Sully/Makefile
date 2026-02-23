#Variables
COMP	= clang
FLAGS	= -Wall -Wextra -Werror
RM		= rm -rf
NAME	= Sully
SRCS	= Sully.c
BUILD	= ./build/

#Rules
all:	$(NAME)

$(NAME): Makefile
		mkdir -p $(BUILD)
		cd $(BUILD); $(COMP) $(FLAGS) ../$(SRCS) -o $(NAME); ./$(NAME)
		@echo "Now let's check the 'diff ../Sully.c Sully_0.c' command line"
		cd $(BUILD) && diff ../Sully.c Sully_0.c
		@echo "wait a bit"
		sleep 10
		@echo "Now let's check the 'diff Sully_3.c Sully_2.c' command line"
		cd $(BUILD) && diff Sully_3.c Sully_2.c

clean:
		$(RM) $(BUILD)

fclean: clean
		$(RM) $(NAME)

re: fclean all

.Phony: re clean fclean all