NB. Summation of primes
NB. Problem 10
NB. The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

NB. Find the sum of all the primes below two million.

2000000([:+/[:x:]#~>)p:i.200000

+/ i.@x:&.(p:^:_1) 2e6

r =. +/ p: i. x: (p:^:_1) 2e6

echo r
