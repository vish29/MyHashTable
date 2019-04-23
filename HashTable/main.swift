import Foundation


/*
let hashMap = MyHashSet()

hashMap.add(1)
hashMap.add(2)
hashMap.add(1)
hashMap.add(2)

print(hashMap.contains(1))
print(hashMap.contains(3))

hashMap.add(2);
print(hashMap.contains(2))
hashMap.remove(2);
print(hashMap.contains(2))


*/

let hashMap = MyHashMap();
hashMap.put(1, 1)
hashMap.put(2, 2)
print(hashMap.get(1))
print(hashMap.get(3))
hashMap.put(2, 1)
print(hashMap.get(2))
hashMap.remove(2);
print(hashMap.get(2))
