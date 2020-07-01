//
//  main.swift
//  HelloSwift
//
//  Created by muhlenXi on 2019/9/19.
//  Copyright © 2019 muhlenXi. All rights reserved.
//

import Foundation

// DP 718
func findLength(_ A: [Int], _ B: [Int]) -> Int {
    var maxLength = 0
    
    // 明确状态 -> 定义 dp 数组/函数的含义 -> 明确选择 -> 明确 base case
    // dp(i,j) = dp(i-1,j-1) + 1
    let row = Array(repeating: 0, count: B.count)
    var dpTable = Array(repeating: row, count: A.count)
    
    for i in 0..<A.count {
        for j in 0..<B.count {
            if A[i] == B[j] {
                if i-1 >= 0, j-1 >= 0 {
                    dpTable[i][j] = dpTable[i-1][j-1] + 1
                } else {
                    dpTable[i][j] = 1
                }
                maxLength = max(maxLength, dpTable[i][j])
            }
        }
    }
    return maxLength
}

// 暴力穷举
func findLength1(_ A: [Int], _ B: [Int]) -> Int {
    var maxLength = 0
    
    var i = 0
    var j = 0
    while i < A.count{
        while j < B.count && B[j] != A[i] {
            j += 1
        }
        var ii = i
        var jj = j
        var newLength = 0
        while ii < A.count && jj < B.count && A[ii] == B[jj] {
            newLength += 1
            ii += 1
            jj += 1
        }
        maxLength = max(newLength, maxLength)
        
        i += 1
        j = 0
    }
    
    return maxLength
}

func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    guard coins.count > 0 else { return 0 }
    guard amount > 0 else { return 0 }
    let total = amount + 1
    var dpTable = Array(repeating: total, count: total)
    // dp(i) = min(dp(i-coin)+1, dp(i))
    dpTable[0] = 0
    for i in 0..<total {
        for coin in coins {
            if i - coin < 0 { continue }
            dpTable[i] = min(dpTable[i-coin]+1, dpTable[i])
        }
    }
    if dpTable[amount] == total {
        return -1
    }
    return dpTable[amount]
}



let c = [1, 2, 5]
print(coinChange(c, 11))

