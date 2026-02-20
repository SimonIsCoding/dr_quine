#Variables
NAME	= Colleen
CFLAGS	= -Wall -Wextra -Werror
CC		= clang
SRCS	= Colleen.c
OBJS	= $(SRCS:.c=.o)
RM		= rm -rf

#Rules
all:	$(NAME)

$(NAME):Makefile $(OBJS)
		$(CC) $(CFLAGS) $(OBJS) -o $(NAME)

%.o:	%.c
		$(CC) $(CFLAGS) -c $< -o $@

clean:
		$(RM) $(OBJS)

fclean: clean
		$(RM) $(NAME)

re:		fclean all

.PHONY:	all fclean clean re