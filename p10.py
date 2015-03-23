#Summation of primes
#Problem 10
#The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
#Find the sum of all the primes below two million.

import math
import time
from itertools import compress

st = time.time()

def isPrime(x):
	for i in range(2, math.floor(math.sqrt(x))+1):
		if x%i == 0:
			return False
	return True

def myFun():
	s = 2
	for x in range(3, 2000000,2):
		if isPrime(x):
			s += x
	print(s)

def f1():
	a = list(range(2000001))
	a[1] = 0
	for num in a:
		if num == 0:
			continue
		for k in range(2*num, 2000001, num):
			a[k] = 0
	mysum = sum(set(a))
	print(mysum)


def primes(lim):
  BA = bytearray
  prime = BA([1])*(lim+1)
  prime[0]=prime[1]=0
  for p in range(2, int(lim**0.5)+1):
    if prime[p]: prime[p*p::p] = BA(1 + lim//p - p)
  return compress(range(lim+1), prime)

#print(sum(primes(20**6)))

def P10(n):
    r = int(n**0.5)
    assert r*r <= n and (r+1)**2 > n
    V = [n//i for i in range(1,r+1)]
    V += list(range(V[-1]-1,0,-1))
    S = {i:i*(i+1)//2-1 for i in V}
    for p in range(2,r+1):
        if S[p] > S[p-1]:  # p is prime
            sp = S[p-1]  # sum of primes smaller than p
            p2 = p*p
            for v in V:
                if v < p2: break
                S[v] -= p*(S[v//p] - sp)
    return S[n]

print(P10(2*10**6))
print('Time spent:',time.time()-st)
