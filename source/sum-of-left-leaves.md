---
title: Leetcode 404 - Sum of left leaves
date: 2021-09-28 16:44:15
tags:
- binary tree
---
**`Note`**
- Very typical recursion problem.
- The key is to check if cur node's `left subtree` is a leaf node.

Given the root of a binary tree, return the sum of all left leaves.

**`Example`**

![img](https://assets.leetcode.com/uploads/2021/04/08/leftsum-tree.jpg)
```
Input: root = [3,9,20,null,null,15,7]
Output: 24
Explanation: There are two left leaves in the binary tree, with values 9 and 15 respectively.
```

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
var sumOfLeftLeaves = function(root) {
  let result = 0;
  result = recursion(root);
  return result;
  
  function recursion(node) {
    if (!node) return 0;
    if (node.left && !node.left.left && !node.left.right) {
      return node.left.val + recursion(node.left) + recursion(node.right);
    }
    return recursion(node.left) + recursion(node.right);
  }
};
```