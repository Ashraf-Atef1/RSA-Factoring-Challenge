#!/usr/bin/python3
import sys
def print_result(request_num, results_file):
    for result in results_file:
        if result.startswith(f"{request_num[:-1]}="):
            return (result[:-1])
    return ""
with open(sys.argv[1], "r") as request:
    with open("f_nums", "r") as f_nums:
        for line in request:
            if line[:-1] != print_result(line, f_nums).split("=")[0]:
                print(f"error {line[:-1]}")
            