from sys import argv
with open(argv[1], "r") as f:
    for line in f:
        num = int(line)
        for i in range(2, num):
            if not num % i:
                print(f"{num}={num // i}*{i}")
                break
