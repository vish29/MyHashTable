import Foundation

fileprivate class MyNode {
    let key: Int
    var next: MyNode? = nil
    
    init(key: Int) {
        self.key = key
    }
}

class MyHashSet {
    private static let kBucketSize = 100000
    
    private var bucket:[MyNode?] = Array(repeating: nil, count: MyHashSet.kBucketSize)
    
    func add(_ key: Int) {
        let hashVal = MyHashSet.hash(key)
        
        if bucket[hashVal] == nil {
            bucket[hashVal] = MyNode(key: key)
            return
        }
        
        var head =  bucket[hashVal]!
        while true {
            if head.key == key {
                return
            }
            
            if head.next == nil {
                head.next = MyNode(key: key)
                return
            }
            head = head.next!
        }
    }
    
    func remove(_ key: Int) {
        let hashVal = MyHashSet.hash(key)
        
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
    
    func contains(_ key: Int) -> Bool {
        var head = bucket[MyHashSet.hash(key)]
        while head != nil {
            if head!.key == key { return true }
            head = head!.next
        }
        return false
    }
    
    private static func hash(_ key: Int) -> Int {
        return key % MyHashSet.kBucketSize
    }
}
