#Largest prime factor
#Problem 3
#The prime factors of 13195 are 5, 7, 13 and 29.

#What is the largest prime factor of the number 600851475143 ?

def maxprm(n):
    t=n
    i=2
    while i < t :
        if t%i == 0:
            t = t/i
        else:
            i+=1
    return i
            
print(maxprm(600851475143))
print(maxprm(73))
