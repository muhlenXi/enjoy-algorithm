//
//  main.swift
//  HelloSwift
//
//  Created by muhlenXi on 2019/9/19.
//  Copyright © 2019 muhlenXi. All rights reserved.
//

import Foundation

func findSpecialInteger(_ arr: [Int]) -> Int {
    guard arr.count != 1 else {
        return arr.first!
    }

    var target = arr.count / 4
    if arr.count % 4 != 0 {
        target += 1
    }
    
    for index in 0..<arr.count {
        if arr[index] == arr[index+target] {
            return arr[index]
        }
    }
    
    return 0
}

let list = [1, 1]
print(findSpecialInteger(list))










