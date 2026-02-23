#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>
#define CODE "#include <sys/stat.h>%c#include <sys/types.h>%c#include <unistd.h>%c#include <stdio.h>%c#include <fcntl.h>%c#include <stdlib.h>%c#define CODE %c%s%c%c%cint main(void)%c{%c	int	i = %d;%c	char filename[256];%c	char executable[256];%c	char command[256];%c	if (i < 0)%c		return(0);%c	snprintf(executable, sizeof(executable), %cSully_%%d%c, i);%c	snprintf(filename, sizeof(filename), %cSully_%%d.c%c, i--);%c	dprintf(open(filename, O_CREAT | O_WRONLY | O_TRUNC, 0644), CODE, 10, 10, 10, 10, 10, 10, 34, CODE, 34, 10, 10, 10, 10, i, 10, 10, 10, 10, 10, 10, 34, 34, 10, 34, 34, 10, 10, 34, 34, 10, 10);%c	snprintf(command, sizeof(command), %cclang -Wall -Wextra -Werror %%s -o %%s && ./%%s%c, filename, executable, executable);%c	system(command);%c}"

int main(void)
{
	int	i = 0;
	char filename[256];
	char executable[256];
	char command[256];
	if (i < 0)
		return(0);
	snprintf(executable, sizeof(executable), "Sully_%d", i);
	snprintf(filename, sizeof(filename), "Sully_%d.c", i--);
	dprintf(open(filename, O_CREAT | O_WRONLY | O_TRUNC, 0644), CODE, 10, 10, 10, 10, 10, 10, 34, CODE, 34, 10, 10, 10, 10, i, 10, 10, 10, 10, 10, 10, 34, 34, 10, 34, 34, 10, 10, 34, 34, 10, 10);
	snprintf(command, sizeof(command), "clang -Wall -Wextra -Werror %s -o %s && ./%s", filename, executable, executable);
	system(command);
}