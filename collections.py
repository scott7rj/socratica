
#list
prime_numbers = [2, 3, 5, 7, 11, 13, 17]

#tuple
perfect_squares = (1, 4, 9, 16, 25, 36)

print("# primes =", len(prime_numbers))
print("# squares =", len(perfect_squares))

for p in prime_numbers:
    print("Prime: ", p)
for n in perfect_squares:
    print("Square: ", n)

print("List methods")
print(dir(prime_numbers))
print(80*"-")

print("Tuple methods")
print(dir(perfect_squares))
print(80*"-")

import sys
print(dir(sys))
print(help(sys.getsizeof))

list_eg = [1, 2, 3, "a", "b", "c", True, 3.14159]
tuple_eg = (1, 2, 3, "a", "b", "c", True, 3.14159)

print("List size: ", sys.getsizeof(list_eg))
print("Tuple size: ", sys.getsizeof(tuple_eg))

import timeit
list_test = timeit.timeit(stmt="[1,2,3,4,5]", number=1000000)
tuple_test = timeit.timeit(stmt="(1,2,3,4,5)", number=1000000)
print("List time: ", list_test)
print("Tuple time: ", tuple_test)

a, b, c = ("aardvark", "buffalo", "cat")
print(a, b, c)

example = set()
dir(example)
help(example.add)
example.add(42)
example.add(False)
example.add(3.14159)
example.add("Thorium")
len(example)
example.remove(42)
example.remove(50)
example.discard(50)

example2 = set([28, True, 2.71828, "Helium"])
example2.clear()

odds = set([1,3,5,7,9])
evens = set([2,4,6,8,10])
primes = set([2,3,5,7])
composites = set([4,6,8,9,10])

odds.union(evens)
evens.union(odds)
odds.intersection(primes)
primes.intersection(evens)
evens.intersection(odds)

2 in primes
6 in odds
9 not in evens

#lists
#example = list()
#example = []

primes = [1,3,5,7,11,13]
primes.append(17)
primes.append(19)
primes[2:5]
numbers = [1,2,3]
letters = ['a','b','c']

#dictionary
post = {"user_id":209, 
"message":"D5 E5 C5 C4 G4", 
"language":"english", 
"datetime":"20230215T24231Z", 
"location":(44.590533, -104.715556)}

type(post)

post2 = dict(message="SS Copopaxi", language="english")
post2["user_id"] = 209
post2["datetime"] = "19771116T093001Z"

print(post['message'])

if 'location' in post2:
    print(post['location'])
else:
    print('the post doesn\'t contain a location value')

loc = post2.get('location', None)

for key in post.keys():
    value = post[key]
    print(key, "=", value)

for key, value in post.items():
    print(key, "=", value)






