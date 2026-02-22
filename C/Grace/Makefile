#Variables
NAME	= Grace
RM		= rm -rf
SRCS	= Grace.c
OBJS	= $(SRCS:.c=.o)
COMP	= clang
FLAGS	= -Wall -Wextra -Werror

#Rules
all: 	$(NAME)

$(NAME): Makefile $(OBJS)
		$(COMP) $(FLAGS) $(OBJS) -o $(NAME)

%.o: 	%.c
		$(COMP) $(FLAGS) -c $< -o $@

clean:
		$(RM) $(OBJS)

fclean: clean
		$(RM) $(NAME) Grace_kid.c

re: 	fclean all

.PHONY: all fclean clean re