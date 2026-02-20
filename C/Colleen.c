// This is a comment
#include <stdio.h>

void print_func(char *s)
{
	printf(s);
	return ;
}

int main(void)
{
	// Comment inside of main 
	print_func("calling print_func");
	char *s = "Ma chaine est : %s";
	printf(s, s);
	return (0);
}