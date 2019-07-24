import math; import itertools; import functools
floorlog = lambda x, y: math.floor(math.log(x, y))
product = lambda i: functools.reduce(lambda x, y: x*y, i, 1)
takewhile_less = lambda n, i: itertools.takewhile(n.__gt__, i)

def naiveprimes():
    primes = set()
    for p in itertools.count(2):
        if all(p%q != 0 for q in primes):
            primes.add(p); yield p

N = 20

solution5 = product(p**floorlog(N, p) for p in takewhile_less(N, naiveprimes()))

print(solution5)