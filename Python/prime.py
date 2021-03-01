#!/usr/bin/env python3


def get_prime_numbers(r_num):
    primes = []
    for i in range(1, r_num):
        isPrime = True
        for j in range(3, i):
            if i % (j - 1) == 0:
                isPrime = False
                break
        if isPrime:
            primes.append(i)
    return primes


def main():
    number = int(input('Enter number for prime: '))
    prime_num = get_prime_numbers(number)
    print(prime_num)


if __name__ == '__main__':
    main()
