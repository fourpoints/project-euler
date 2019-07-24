import math
import numpy as np # for array

def primes(U):
    sieve = np.full(U, True, dtype=bool)
    sieve[0] = sieve[1] = False

    for i in range(U):
        if not sieve[i]: continue
        sieve[i*i::i] = False

        yield i

# math.isqrt is included from 3.8+
isqrt = lambda n: math.floor(math.sqrt(n))

L = 600_851_475_143
P = 1

# This is a bad solution
for p in primes(isqrt(L)):
    if L < p**2: break
    if L % p != 0: continue
    P = p
    while L % p == 0: L //= p

solution3 = max(L, P)

print(solution3)
