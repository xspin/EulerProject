#Special Pythagorean triplet
#Problem 9
#A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
#
#a2 + b2 = c2
#For example, 32 + 42 = 9 + 16 = 25 = 52.
#
#There exists exactly one Pythagorean triplet for which a + b + c = 1000.
#Find the product abc.
#!/usr/bin/python
from math import sqrt 
import time
st = time.time()
for a in range(1, 334):
	for b in range(a+1, (1000-a)//2):
		c = 1000 - a - b
		if c**2 == a**2 + b **2:
			 print(a,b,c,a*b*c)
print('spent:',time.time()-st,'s')


