import math
import numpy as np # for array

def primes(U):
    sieve = np.full(U, True, dtype=bool)
    sieve[0] = sieve[1] = False

    for i in range(U):
        if not sieve[i]: continue
        sieve[i*i::i] = False

        yield i

solution10 = sum(primes(2_000_000))

print(solution10)