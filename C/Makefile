#Variables
NAME	= Colleen
CFLAGS	= -Wall -Wextra -Werror
CC		= cc
INCLUDES=
SRCS	= ex00.c
OBJS	= $(SRCS:.c=.o)

#Rules
all:	$(NAME)

NAME:	Makefile $(INCLUDES) $(OBJS)
		$(CC) $(CFLAGS) $(SRCS) -o $(NAME)

%.o:	%.c $(INCLUDES)
		$(CC) $(CFLAGS) -c $< -o $@

clean:
		rm -rf $(OBJS)

fclean: clean
		rm -rf $(NAME)

re:		fclean all

.PHONY:	all fclean clean re