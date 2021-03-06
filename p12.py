#Highly divisible triangular number
#Problem 12
#The sequence of triangle numbers is generated by adding the natural numbers. So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first ten terms would be:
#
#1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
#
#Let us list the factors of the first seven triangle numbers:
#
# 1: 1
# 3: 1,3
# 6: 1,2,3,6
#10: 1,2,5,10
#15: 1,3,5,15
#21: 1,3,7,21
#28: 1,2,4,7,14,28
#We can see that 28 is the first triangle number to have over five divisors.
#
#What is the value of the first triangle number to have over five hundred divisors?

import math
def factors(n):
	n //= (2 - n%2)
	m = [n]
	i = 1
	while i < math.floor(math.sqrt(m[-1])):
		if m[-1]%i == 0:
			t = m[-1]
			t = [i, t//i]
			m.pop()
			m.extend(t)
			#i = 1
		i += 1
	return m#len(m)  

def aa(n):
	return n*(n+1)//2

n = 1
#a, b = factors(n), factors(n+1)
#while a*b < 5:
#	n += 1
#	a, b = b, factors(n)

#print(n, a*b)
for m in range(1, 8):
	print(aa(m), factors(m),factors(m+1))
