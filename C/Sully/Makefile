#Variables
COMP	= clang
FLAGS	= -Wall -Wextra -Werror
RM		= rm -rf
OBJS	= $(SRCS:.c=.o)
NAME	= Sully
SRCS	= Sully.c

#Rules
all:	$(NAME)

$(NAME): Makefile $(OBJS)
		$(COMP) $(FLAGS) $(OBJS) -o $(NAME)

%.o:	%.c
		$(COMP) $(FLAGS) -c $< -o $@

clean:
		$(RM) $(OBJS)

fclean: clean
		$(RM) $(NAME) ./build Sully_{0..5}.c a.out Sully_{0..5}

re: fclean all

.Phony: re clean fclean all