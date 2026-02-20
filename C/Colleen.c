// char *s = "// This is a comment%c#include <stdio.h>%c%cvoid print_func(char *s)%c{%c  	printf(%cchar *s = %c%s%c;%c%s%c, 34, s, 34, 10, s);%c}%c%cint main(void)%c{%c	// Comment inside of main%c	print_func(s);%c}";
// This is a comment
#include <stdio.h>

// void print_func(char *s)
void print_func(void)
{
  	printf("// This is a comment%c#include <stdio.h>%c%cvoid print_func(char *s)%c{%c  	printf(%c%c, 34, s, 34, 10, s);%c}%c%cint main(void)%c{%c	// Comment inside of main%c	print_func(s);%c}", 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10);
}

int main(void)
{
	// Comment inside of main
	print_func();
}