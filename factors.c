#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>

int main(int argc, char const *argv[])
{
	FILE *file = NULL;
	size_t size;
	char *number_str;

	if (argc != 2)
	{
		fprintf(stderr, "Usage: factor <filename>\n");
		exit(EXIT_FAILURE);
	}
	file = fopen(argv[1], "r");
	if (file == NULL)
	{
		fprintf(stderr, "Error: can't open file %s\n", argv[1]);
		exit(EXIT_FAILURE);
	}
	while (getline(&number_str, &size, file) != -1)
	{
		unsigned long long number = (unsigned long long)atoi(number_str);

		printf("%d\n", number);
	}
	return 0;
}
