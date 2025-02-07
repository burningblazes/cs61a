def is_prime(n):
    """Returns True if n is a prime number and False otherwise.

    >>> is_prime(2)
    True
    >>> is_prime(16)
    False
    >>> is_prime(521)
    True
    """
    assert n>1
    def foo(x):
        if n==x:
            return True
        elif n % x==0:
            return False
        else:
            return foo(x+1)
    return foo(2)
        
