def paths(m, n):
    """Return the number of paths from one corner of an
    M by N grid to the opposite corner.
    >>> paths(2, 2)
    2
    >>> paths(5, 7)
    210
    >>> paths(117, 1)
    1
    >>> paths(1, 157)
    1
    """
    "*** YOUR CODE HERE ***"
    def foo(x,y,res):
        if x==m and y==n:
            return res
        elif x==m or y==n:
            return res+1
        else:
            return foo(x+1,y,res)+foo(x,y+1,res)
    return foo(1,1,0)
