// il faut une boucle for/while
// il faut une fonction qui crees des fichiers
// il faut que la variable change au niveau de la creation du fichier
// il faut gerer l'etat du compteur i

// utiliser drpintf et sprintf
// utiliser la fonction system
#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>
#define FILENAME

int main(void)
{
	int	i = 5;
	char filename[10];
	while (i > 0)
	{
		snprintf(filename, sizeof(filename), "Sully_%d", i);
		open(filename, O_CREAT | O_WRONLY | O_TRUNC, 0644);
		printf("%s\n", filename);
		system("clang -Wall -Wextra -Werror Sully.c");
		printf("file A %i", i);
		i--;
	}
	return (0);
}