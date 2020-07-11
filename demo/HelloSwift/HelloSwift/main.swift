//
//  main.swift
//  HelloSwift
//
//  Created by muhlenXi on 2019/9/19.
//  Copyright © 2019 muhlenXi. All rights reserved.
//

import Foundation

func preorder(_ root: Node?) -> [Int] {
    guard let root = root else {
        return []
    }
    
    var result = [root.val]
    for node in root.children {
        result.append(contentsOf: preorder(node))
    }
    return result
}


func postorder(_ root: Node?) -> [Int] {
    guard let root = root else {
        return []
    }
    
    var result = [Int]()
    for node in root.children {
        result.append(contentsOf: postorder(node))
    }
    return result + [root.val]
}

func postorder1(_ root: Node?) -> [Int] {
    guard let root = root else {
        return []
    }
    
    var stack = [root]
    var result = [Int]()
    
    while !stack.isEmpty {
        let node = stack.removeLast()
        result.append(node.val)
        if !node.children.isEmpty {
            stack.append(contentsOf: node.children)
        }
    }
    
    return result.reversed()
}









let node1 = Node(1)
let node2 = Node(2)
let node3 = Node(3)
let node4 = Node(4)
let node5 = Node(5)
let node6 = Node(6)
node1.children = [node3, node2, node4]
node3.children = [node5, node6]

print(postorder(node1))
print(postorder1(node1))




