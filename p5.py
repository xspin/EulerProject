#Smallest multiple
#Problem 5
#2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

#What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

def mf(n, m):
    if m%n == 0:
        if n==11:
            return m
        return mf(n-1, m)
    else:
        return mf(n+(n<20), n+n*(m//n))

#print(mf(20,20))

n=m=20
while n > 1 :
    if m%n == 0:
        n -= 1
    else:
        n, m = n+(n<20), n+n*(m//n)

print(m)
