#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>
#define FILENAME
#define CODE "#include <stdio.h>%c#include <fcntl.h>%c#include <stdlib.h>%c#define FILENAME%c#define CODE %c%s%c%c%cint main(void)%c{%c	int	i = %d;%c	char filename[10];%c	while (i >= 0)%c	{%c		snprintf(filename, sizeof(filename), %cSully_%d.c%c, i);%c		dprintf(open(filename, O_CREAT | O_WRONLY | O_TRUNC, 0644), CODE, 10, 10, 10, 10, 34, CODE, 34, 10, 10, 10, 10, i, 10, 10, 10, 10, 34, i, 34, 10, 10, 34, 34, 10, 10, 10);%c		system(%cclang -Wall -Wextra -Werror Sully.c%c);%c		i--;	%c	}%c}"

int main(void)
{
	int	i = 1;
	char filename[10];
	while (i >= 0)
	{
		snprintf(filename, sizeof(filename), "Sully_1.c", i);
		dprintf(open(filename, O_CREAT | O_WRONLY | O_TRUNC, 0644), CODE, 10, 10, 10, 10, 34, CODE, 34, 10, 10, 10, 10, i, 10, 10, 10, 10, 34, i, 34, 10, 10, 34, 34, 10, 10, 10);
		system("clang -Wall -Wextra -Werror Sully.c");
		i--;	
	}
}