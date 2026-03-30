#include <string.h>
#include <unistd.h>
#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>
#define CODE "#include <string.h>%1$c#include <unistd.h>%1$c#include <stdio.h>%1$c#include <fcntl.h>%1$c#include <stdlib.h>%1$c#define CODE %2$c%3$s%2$c%1$c%1$cint main(void)%1$c{%1$c	int i = %4$d;%1$c	char buffer[256];%1$c	char executable[256];%1$c	char command[256];%1$c	int	fd;%1$c	snprintf(buffer, sizeof(buffer), %2$cSully_%%d.c%2$c, i);%1$c	if (!strcmp(buffer, __FILE__))%1$c		i--;%1$c	if (i < 0)%1$c		return(0);%1$c	snprintf(executable, sizeof(executable), %2$cSully_%%d%2$c, i);%1$c	snprintf(buffer, sizeof(buffer), %2$cSully_%%d.c%2$c, i);%1$c	fd = open(buffer, O_CREAT | O_WRONLY | O_TRUNC, 0644);%1$c	if (fd == -1)%1$c		return (1);%1$c	dprintf(fd, CODE, 10, 34, CODE, i);%1$c	close(fd);%1$c	snprintf(command, sizeof(command), %2$cclang -Wall -Wextra -Werror %%s -o %%s && ./%%s%2$c, buffer, executable, executable);%1$c	system(command);%1$c	return (0);%1$c}"

int main(void)
{
	int i = 5;
	char buffer[256];
	char executable[256];
	char command[256];
	int	fd;
	snprintf(buffer, sizeof(buffer), "Sully_%d.c", i);
	if (!strcmp(buffer, __FILE__))
		i--;
	if (i < 0)
		return(0);
	snprintf(executable, sizeof(executable), "Sully_%d", i);
	snprintf(buffer, sizeof(buffer), "Sully_%d.c", i);
	fd = open(buffer, O_CREAT | O_WRONLY | O_TRUNC, 0644);
	if (fd == -1)
		return (1);
	dprintf(fd, CODE, 10, 34, CODE, i);
	close(fd);
	snprintf(command, sizeof(command), "clang -Wall -Wextra -Werror %s -o %s && ./%s", buffer, executable, executable);
	system(command);
	return (0);
}