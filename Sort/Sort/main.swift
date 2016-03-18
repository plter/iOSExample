//
//  main.swift
//  Sort
//
//  Created by plter on 3/17/16.
//  Copyright © 2016 jikexueyuan. All rights reserved.
//

import Foundation

var arr = [2,4,5,1,0,9,8]

var tmp:Int
for i in 0..<arr.count{
    for j in i+1..<arr.count{
        if arr[i]<arr[j]{
            tmp = arr[i]
            arr[i] = arr[j]
            arr[j]=tmp
        }
    }
}

print(arr)








