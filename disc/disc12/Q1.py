def word_rope(s):
    """Return a rope of the words in string s.
    >>> word_rope('the last week')
    ['t', 'h', 'e', ['l', 'a', 's', 't', ['w', 'e', 'e', 'k']]]
    """
    assert s and s[0] != ' ' and s[-1] != [ ]
    result = []
    word = result
    for x in s:
        if x == ' ':
            "*** YOUR CODE HERE ***"
            word.append([])
            word=word[-1]
        else:
            "*** YOUR CODE HERE ***"
            word.append(x)
    return result