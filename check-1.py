#!/usr/bin/python3
with open("f_nums", "r") as f_nums:
    for line in f_nums:
        line = line[:-1]
        nums = line.split("=")[1].split("*")
        if int(line.split("=")[0]) != int(nums[0]) * int(nums[1]):
            print("error")
