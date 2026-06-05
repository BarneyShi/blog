---
title: Leetcode 530 - Min absolute diff in bst
date: 2021-09-29 20:41:33
tags:
- binary tree
- bst
---
**`Note:`**
- Because it's a BST, then its `inorder traversal` in in ascdending order. 
- Iterate the inorder traversal and we can find the result.

Given the root of a Binary Search Tree (BST), return the minimum absolute difference between the values of any two different nodes in the tree.

**`Example`**

![img](https://assets.leetcode.com/uploads/2021/02/05/bst1.jpg)
```
Input: root = [4,2,6,1,3]
Output: 1
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
var getMinimumDifference = function(root) {
  let traversal = [];
  inorder(root);
  let result = Infinity;
  for (let i = 1; i < traversal.length; i++) {
    result = Math.min(result, traversal[i] - traversal[i-1]);
  }
  return result;
  
  function inorder(node) {
    if (!node) return;
    node.left && inorder(node.left);
    traversal.push(node.val);
    node.right && inorder(node.right);
  }
};
```