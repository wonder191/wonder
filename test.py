try:
    a = input('Enter one number:')
    b = input('Enter one number again:')
    x = a/b
    print x
except Exception, e:
    print e
finally:
    del a,b,x
