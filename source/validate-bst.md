---
title: Leetcode 98 - Validate BST
date: 2021-09-29 19:48:08
tags:
- binary tree
---
**`Note:`**
- Use `inorder` traversal. 
- If a tree is a BST, then its `inorder` traversal would be a `strictly increasing array`.

Given the root of a binary tree, determine if it is a valid binary search tree (BST).

A valid BST is defined as follows:

- The left subtree of a node contains only nodes with keys less than the node's key.
- The right subtree of a node contains only nodes with keys greater than the node's key.
- Both the left and right subtrees must also be binary search trees.

**`Example`**
![img](https://assets.leetcode.com/uploads/2020/12/01/tree1.jpg)
```
Input: root = [2,1,3]
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
var isValidBST = function(root) {
  if (!root.left && !root.right) return true;
  let inorder = [];
  traverse(root, inorder);
  let sorted = true;
  for (let i = 1; i < inorder.length; i++) {
    if (inorder[i] <= inorder[i-1]) sorted = false;
  }
  return sorted;
  
  function traverse(node, inorder) {
    if (!node) return;
    node.left && traverse(node.left, inorder);
    inorder.push(node.val);
    node.right && traverse(node.right, inorder);
  }
};
```