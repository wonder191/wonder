try:
    a = input('Enter one number:')
    b = input('Enter one number again:')
    x = a/b
    print x
except Exception, e:
    print e
else:
    del a,b,x
