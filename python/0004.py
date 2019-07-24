from itertools import product

solution4 = max(
    i*j
    for i, j
    in product(range(100, 1000), range(100, 1000))
    if i*j == int(str(i*j)[::-1])
)

# update with := syntax in 3.8
# largest_palindrome = max(
#     (P := i*j)
#     for i, j
#     in product(range(100, 1000), range(100, 1000))
#     if P == int(str(P)[::-1])
# )

print(solution4)