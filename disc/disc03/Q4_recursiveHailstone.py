def hailstone(n):
    """Print the hailstone sequence starting at n and return its
    length.

    >>> a = hailstone(10)
    10
    5
    16
    8
    4
    2
    1
    >>> a
    7
    >>> b = hailstone(1)
    1
    >>> b
    1
    """
    "*** YOUR CODE HERE ***"
    
    def foo(n,res):
        print(n)
        if n==1:
            return res
        elif n%2==0:
            return foo(n//2,res+1)
        else:
            return foo(3*n+1,res+1)
    
    return foo(n,1)

