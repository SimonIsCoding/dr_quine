// This is a comment
#include <stdio.h>

void print_func(char *s)
{
  	printf("// This is a comment%c#include <stdio.h>%c%cvoid print_func(char *s)%c{%c  	printf(%c%s%c, 10, 10, 10, 10, 10, 34, s, 34, 10, 10, 10, 10, 10, 10, 34, s, 34, 10);%c}%c%cint main(void)%c{%c	// Comment inside of main%c	print_func(%c%s%c);%c}", 10, 10, 10, 10, 10, 34, s, 34, 10, 10, 10, 10, 10, 10, 34, s, 34, 10);
}

int main(void)
{
	// Comment inside of main
	print_func("// This is a comment%c#include <stdio.h>%c%cvoid print_func(char *s)%c{%c  	printf(%c%s%c, 10, 10, 10, 10, 10, 34, s, 34, 10, 10, 10, 10, 10, 10, 34, s, 34, 10);%c}%c%cint main(void)%c{%c	// Comment inside of main%c	print_func(%c%s%c);%c}");
}