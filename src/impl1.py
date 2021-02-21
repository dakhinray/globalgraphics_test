#!/usr/bin/env python3
#
import os
import sys
import argparse
import math


def impl1(num):
    # algorithm brute_force
    # input: integer upper_bound
    count = 0
    for n in range(2, num+1):
        is_prime = True
        for d in range(n-1, 2-1, -1):
            if n%d == 0:
                is_prime = False
                break
        if is_prime == True:
            count+=1
    return count


def impl2(num):
    # algorithm sieve_of_eratosthenes
    # input: integer upper_bound
    if num < 2:
        return 0
    primes = set(range(2, num+1))
    divisor_limit = math.floor(math.sqrt(num))
    for d in range(2, divisor_limit+1):
        for n in primes.copy():
            if n%d == 0 and d != n:
                primes.remove(n)
    return len(primes)


def impl3(num):
    # algorithm brute_force
    # input: integer upper_bound
    count = 0
    for n in range(2, num+1):
        is_prime = True
        for d in range(2,101):
            if d > n:
                break
            if n % d == 0:
                is_prime = False
                break
        if is_prime == True:
            count += 1
    return count


if __name__ == "__main__":
    # Command line parsing
    usage = "usage: %prog file>"
    parser = argparse.ArgumentParser()
    parser.add_argument('number', type=int, help='Number to check.')

    args = parser.parse_args()

    print(globals()[os.path.basename(sys.argv[0]).split(".")[0]](args.number))