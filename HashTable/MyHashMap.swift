import Foundation

fileprivate class MyNode {
    let key: Int
    var value: Int
    var next: MyNode? = nil
    
    init(key: Int, value: Int) {
        self.key = key
        self.value = value
    }
}
class MyHashMap {
    
    private static let kBucketSize = 100000
    
    private var bucket:[MyNode?] = Array(repeating: nil, count: MyHashMap.kBucketSize)
    
    func put(_ key: Int, _ value: Int) {
        let hashVal = MyHashMap.hash(key)
        
        if bucket[hashVal] == nil {
            bucket[hashVal] = MyNode(key: key, value: value)
            return
        }
        
        var head =  bucket[hashVal]!
        while true {
            if head.key == key {
                head.value = value
                return
            }
            
            if head.next == nil {
                head.next = MyNode(key: key, value: value)
                return
            }
            head = head.next!
        }
    }
    
    func get(_ key: Int) -> Int {
        var head = bucket[MyHashMap.hash(key)]
        while head != nil {
            if head!.key == key { return head!.value }
            head = head!.next
        }
        return -1
    }
    
    func remove(_ key: Int) {
        let hashVal = MyHashMap.hash(key)
        
        guard let head = bucket[hashVal] else {
            return
        }
        
        if head.key == key {
            bucket[hashVal] = nil
        }
        
        var pre:MyNode = head
        var current = head.next
        
        while current != nil {
            if current!.key == key {
                pre.next = current!.next
                return
            }
            pre = current!
            current = current!.next
        }
    }
    
    private static func hash(_ key: Int) -> Int {
        return key % MyHashMap.kBucketSize
    }
}
