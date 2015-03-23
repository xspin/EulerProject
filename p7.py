#10001st prime
#Problem 7
#By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

#What is the 10 001st prime number?

import math
def isPrime(n):
    i=2
    while i <= math.sqrt(n) :
        if n%i == 0:
            return False
        i += 1
    return True

m = 10001
cnt = 0
n = 1
while cnt < m :
    if isPrime(n):
        cnt += 1
    n += 2

print(n-2)
