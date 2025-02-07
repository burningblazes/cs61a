def sevens(n, k):
    """Return the (clockwise) position of who says n among k players.
    >>> sevens(2, 5)
    2
    >>> sevens(6, 5)
    1
    >>> sevens(7, 5)
    2
    >>> sevens(8, 5)
    1
    >>> sevens(9, 5)
    5
    >>> sevens(18, 5)
    2
    """
    def has_seven(i): #contains 7
        if i==0:
            return False
        if i%10==7:
            return True
        else:
            return has_seven(i//10)
        
    def foo(i,who,direction):
        if i==n:
            return who
        if i%7==0 or has_seven(i):
            direction=-direction
        who=(who+direction-1)%k+1
        return foo(i+1,who,direction)
    
    res=foo(1,1,1)
    return res