#include <stdio.h>

void factorize(int number)
{
	int p, q;

	for (p = 2; p <= number / 2; ++p)
	{
		if (number % p == 0)
		{
			q = number / p;

			// Ensure p and q are smaller or equal
			if (p <= q)
			{
				printf("%d=%d*%d\n", number, p, q);
				return;
			}
		}
	}

	// If the loop completes without finding factors, the number is prime
	printf("%d=%d*%d\n", number, 1, number);
}

int main(int argc, char *argv[])
{
	if (argc != 2)
	{
		fprintf(stderr, "Usage: %s <file>\n", argv[0]);
		return 1;
	}

	FILE *file = fopen(argv[1], "r");
	if (!file)
	{
		perror("Error opening file");
		return 1;
	}

	int number;
	while (fscanf(file, "%d", &number) == 1)
	{
		factorize(number);
	}

	fclose(file);
	return 0;
}
