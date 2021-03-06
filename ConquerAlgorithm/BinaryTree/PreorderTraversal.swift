//
//  PreorderTraversal.swift
//  ConquerAlgorithm
//
//  Created by Freelf on 2021/3/18.
//  Copyright © 2021 Freelf. All rights reserved.
//

// https://leetcode-cn.com/problems/binary-tree-preorder-traversal/
// 144. 二叉树的前序遍历

import Foundation
class PreorderTraversalSolution {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var array = [Int]()
        traversal(root, &array)
        return array
    }
    func traversal(_ root: TreeNode?, _ result: inout [Int]) {
        if root == nil {
            return
        }
        result.append(root!.val)
        traversal(root?.left, &result)
        traversal(root?.right, &result)
    }
    
    func preorderTraversal2(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        if root == nil {
            return result
        }
        var stack = [TreeNode]()
        stack.append(root!)
        while !stack.isEmpty {
            let node = stack.removeLast()
            result.append(node.val)
            if let right = node.right {
                stack.append(right)
            }
            if let left = node.left {
                stack.append(left)
            }
        }
        return result
    }
    
    func preorderTraversal3(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        if root == nil {
            return result
        }
        var stack = [TreeNode?]()
        stack.append(root)
        while !stack.isEmpty {
            if stack.last! != nil {
                let last = stack.removeLast()!
                if let right = last.right { stack.append(right) }
                if let left = last.left { stack.append(left) }
                stack.append(last)
                stack.append(nil)
            } else {
                stack.removeLast()
                result.append(stack.removeLast()!.val)
            }
        }
        return result
    }
}
