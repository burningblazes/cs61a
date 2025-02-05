def is_prime(n):
    """
    an even number is not a prime number; check the odd numbers only. 


    >>> is_prime(10)
    False
    >>> is_prime(7)
    True
    >>> is_prime(1) # one is not a prime number!!
    False
    """
    "*** YOUR CODE HERE ***"
    if n==1:
        return False
    if n==2:
        return True
    
    if n%2==0:
        return False
    for i in range(3, n//2,2):
        if n%i==0:
            return False
    return True

