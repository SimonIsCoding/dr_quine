int i = 5;
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define CODE "int i = %4$d;%1$c#include <stdio.h>%1$c#include <stdlib.h>%1$c#include <string.h>%1$c%1$c#define CODE %2$c%3$s%2$c%1$c%1$cint main(void)%1$c{%1$c%5$cchar current_file[100];%1$c%5$cchar new_src[100];%1$c%5$cchar new_exec[100];%1$c%5$cchar command[400];%1$c%5$cFILE *fp;%1$c%1$c%5$cif (i <= 0) return (0);%1$c%5$csprintf(current_file, %2$cSully_%%d.c%2$c, i);%1$c%5$cif (!strcmp(current_file, __FILE__))%1$c%5$c%5$ci--;%1$c%5$csprintf(new_src, %2$cSully_%%d.c%2$c, i);%1$c%5$csprintf(new_exec, %2$cSully_%%d%2$c, i);%1$c%5$cfp = fopen(new_src, %2$cw%2$c);%1$c%5$cif (!fp) return (1);%1$c%5$cfprintf(fp, CODE, 10, 34, CODE, i, 9);%1$c%5$cfclose(fp);%1$c%5$csprintf(command, %2$cclang -Wall -Wextra -Werror %%s -o %%s && ./%%s%2$c, new_src, new_exec, new_exec);%1$c%5$csystem(command);%1$c%5$creturn (0);%1$c}%1$c"

int main(void)
{
	char current_file[100];
	char new_src[100];
	char new_exec[100];
	char command[400];
	FILE *fp;

	if (i <= 0) return (0);
	sprintf(current_file, "Sully_%d.c", i);
	if (!strcmp(current_file, __FILE__))
		i--;
	sprintf(new_src, "Sully_%d.c", i);
	sprintf(new_exec, "Sully_%d", i);
	fp = fopen(new_src, "w");
	if (!fp) return (1);
	fprintf(fp, CODE, 10, 34, CODE, i, 9);
	fclose(fp);
	sprintf(command, "clang -Wall -Wextra -Werror %s -o %s && ./%s", new_src, new_exec, new_exec);
	system(command);
	return (0);
}
