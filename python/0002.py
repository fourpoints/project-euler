from itertools import takewhile
def evenfib():
    # Even :: F(n) = 4*F(n-1) + F(n-2); F(0)=0, F(1)=2
    i, j = 0, 2
    while 1:
        yield i
        i, j = j, 4*j + i

solution2 = sum(takewhile((4_000_000).__gt__, evenfib()))

print(solution2)