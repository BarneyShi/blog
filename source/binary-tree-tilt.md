---
title: Leetcode 563 - Binary tree tilt
date: 2021-11-17 14:16:27
tags:
- dfs
---
**`Note:`**
- `DFS` all the way! I hate iterative traverses.
- Base case: we are looking for `num`, so apparently when `node` is null, we should return `0`.
- Return `|leftSum - rightSum|`.

**`Question:`**

Given the root of a binary tree, return the sum of every tree node's tilt.

The tilt of a tree node is the absolute difference between the sum of all left subtree node values and all right subtree node values. If a node does not have a left child, then the sum of the left subtree node values is treated as 0. The rule is similar if there the node does not have a right child.

**`Example:`**
![img](https://assets.leetcode.com/uploads/2020/10/20/tilt1.jpg)
```
Input: root = [1,2,3]
Output: 1
Explanation: 
Tilt of node 2 : |0-0| = 0 (no children)
Tilt of node 3 : |0-0| = 0 (no children)
Tilt of node 1 : |2-3| = 1 (left subtree is just left child, so sum is 2; right subtree is just right child, so sum is 3)
Sum of every tilt : 0 + 0 + 1 = 1
```

**`Code:`**
```javascript
/**
 * Definition for a binary tree node.
 * function TreeNode(val, left, right) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.left = (left===undefined ? null : left)
 *     this.right = (right===undefined ? null : right)
 * }
 */
/**
 * @param {TreeNode} root
 * @return {number}
 */
var findTilt = function(root) {
  let res = 0;
  dfs(root);
  return res;
  
  function dfs(node) {
    if (!node) return 0;
    const leftSum = node.left ? (node.left.val + dfs(node.left)) : 0;
    const rightSum = node.right ? (node.right.val + dfs(node.right)) : 0;
    node.val = Math.abs(leftSum - rightSum);
    res += node.val;
    return leftSum + rightSum
  }
};
```