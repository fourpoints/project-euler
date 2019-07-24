import math
import numpy as np # for array
from itertools import islice

def primes(U):
    sieve = np.full(U, True, dtype=bool)
    sieve[0] = sieve[1] = False

    for i in range(U):
        if not sieve[i]: continue
        sieve[i*i::i] = False

        yield i

upper_bound = lambda n: math.ceil((n * (math.log(n) + math.log(n)**2)))

# itertools recipe
def nth(iterable, n, default=None):
    "Returns the nth item or a default value"
    return next(islice(iterable, n, None), default)

N = 10001

solution7 = nth(primes(upper_bound(N)), N-1) # 0-indexing

print(solution7)