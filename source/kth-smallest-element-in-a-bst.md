---
title: Leetcode 230 - Kth smallest element in a bst
date: 2021-10-16 17:30:04
tags:
- bst
- binary tree
---
**`Note:`**
- As it's a BST tree, so its `inorder` traversal is a `sorted` array.

**`Question:`**

Given the root of a binary search tree, and an integer k, return the kth smallest value (`1-indexed`) of all the values of the nodes in the tree

**`Example:`**

![img](https://assets.leetcode.com/uploads/2021/01/28/kthtree1.jpg)
```
Input: root = [3,1,4,null,2], k = 1
Output: 1
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
 * @param {number} k
 * @return {number}
 */
var kthSmallest = function(root, k) {
  let traversal = [];
  inorder(root);
  return traversal[k-1];

  function inorder(node) {
    if (!node) return;
    inorder(node.left);
    traversal.push(node.val);
    inorder(node.right);
  }
};
```