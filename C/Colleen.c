char *s = "// This is a comment%c#include <stdio.h>%c%cvoid print_func(char *s)%c{%c  	printf(s);%c}%c%cint main(void)%c{%c	// Comment inside of main%c	print_func();%c}";
// This is a comment
#include <stdio.h>

void print_func(char *s)
{
  	printf("char *s = %c%s%c;%c%s", 34, s, 34, 10, s);
}

int main(void)
{
	// Comment inside of main
	print_func(s);
}