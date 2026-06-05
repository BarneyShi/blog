---
title: Leetcode 110 - Balanced binary tree
date: 2021-09-17 00:56:57
tags:
- leetcode
- binary tree
---
**`Note`**
- Need a helper `height` AKA `maxHeight`
- Recursively to check if a node's `left subtree's height` and `right subtree's height` differ by no more than `1`.

Given a binary tree, determine if it is height-balanced.

For this problem, a height-balanced binary tree is defined as:

a binary tree in which the left and right subtrees of every node differ in height by no more than 1.

**Example**

![img](https://assets.leetcode.com/uploads/2020/10/06/balance_1.jpg)
```
Input: root = [3,9,20,null,null,15,7]
Output: true
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
 * @return {boolean}
 */
var isBalanced = function(root) {
  if (!root) return true;
  return Math.abs(height(root.left) - height(root.right)) <= 1 && isBalanced(root.right) && isBalanced(root.left);
};

function height(node) {
  if (!node) return 0;
  return 1 + Math.max(height(node.left), height(node.right));
}
```