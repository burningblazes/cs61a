def max_product(s):
    """Return the maximum product of non-consecutive elements of s.

    >>> max_product([10, 3, 1, 9, 2])       # 10 * 9
    90
    >>> max_product([5, 10, 5, 10, 5])      # 5 * 5 * 5
    125
    >>> max_product([])                     # The product of no numbers is 1
    1
    """
    if s==[]:
        return 1
    elif len(s)<=2:
        return max(s)
    return max(max_product(s[2:])*s[0], s[1]*max_product(s[3:]))
    