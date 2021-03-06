//
//  main.swift
//  HelloSwift
//
//  Created by muhlenXi on 2019/9/19.
//  Copyright © 2019 muhlenXi. All rights reserved.
//

import Foundation

//
func isSymmetric(_ root: TreeNode?) -> Bool {
    guard let root = root else { return true }
    return check(root.left, t2: root.right)
}

func check(_ t1: TreeNode?, t2: TreeNode?) -> Bool {
    switch (t1, t2) {
    case (nil, nil):  // 都是空节点
        return true
    case (_, nil), (nil, _): // 有一个位空
        return false
    default:
        if t1!.val != t2!.val { // 两个值不等
            return false
        } else {
            return check(t1?.left, t2: t2?.right) && check(t1?.right, t2: t2?.left)
        }
    }
}
