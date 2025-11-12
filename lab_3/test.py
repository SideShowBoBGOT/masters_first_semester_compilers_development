import itertools
a = [1, 2, 3, 4, 5, 6]

print(a[10: 20])

for el in itertools.batched(a, 2):
    print(el)