# squared polar-cartesian identity for the complex number {m + 1j*n}
# sqrt(m**2 + n**2)**2 * expj(m, n) = (m + 1j*n)**2 = (m**2 - n**2) + 2j*m*n
# => (m**2 + n**2)**2 = (m**2 - n**2)**2 + (2*m*n)**2
# => a = m**2 - n**2 ; b = 2*m*n ; c = m**2 + n**2

a = lambda m, n: m**2 - n**2
b = lambda m, n: 2*m*n
c = lambda m, n: m**2 + n**2

# we can then rewrite the sum of (a, b, c) in terms of (m, n)
# a + b + c = 2*m**2 + 2*m*n = 2*(m+n)*m = 1000
# => (m+n)*m = 500

# we cannot have negative values
# a = m**2 - n**2 => m>n>0

# m and n are bounded
# n>0 and m**2 < (m+n)*m = 500 => m < sqrt(500) ~ 23
# n<m => (m+m)*m > 500 => m > sqrt(500/2) ~ 15
# n<m => (n+n)*n < 500 => n < sqrt(500/2) ~ 15

try:
    solution9 = next(
        a(m,n) * b(m,n) * c(m,n)
        for m in range(15+1, 23)
        for n in range(15+1)
        if (m+n)*m == 1000/2
    )
    print(solution9)

except StopIteration:
    print("No solution")
