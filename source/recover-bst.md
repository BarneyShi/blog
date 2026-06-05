---
title: Leetcode 99 - Recover BST
date: 2021-11-27 01:09:30
tags:
- bst
- binary tree
---
**`Note:`**
- `Inorder` traversal of `BST` is a sorted array.
- Find the two elements that are `bigger` than their next.
- Swap their vals.

**`Question:`**

You are given the `root` of a binary search tree (BST), where the values of exactly two nodes of the tree were swapped by mistake. Recover the tree without changing its structure.

**`Example:`**
![img](https://assets.leetcode.com/uploads/2020/10/28/recover1.jpg)
```
Input: root = [1,3,null,null,2]
Output: [3,1,null,null,2]
Explanation: 3 cannot be a left child of 1 because 3 > 1. Swapping 1 and 3 makes the BST valid.
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
 * @return {void} Do not return anything, modify root in-place instead.
 */
var recoverTree = function(root) {
  const inorder = [];
  traverse(root);
  let n1 = 0, n2 = inorder.length - 1;
  while (n1 < n2) {
    if (inorder[n1].val > inorder[n1 + 1].val && inorder[n2].val < inorder[n2 - 1].val) break;
    if (inorder[n1].val < inorder[n1 + 1].val) n1++;
    if (inorder[n2].val > inorder[n2 - 1].val) n2--;
  }
  [inorder[n1].val, inorder[n2].val] = [inorder[n2].val, inorder[n1].val];

  function traverse(node) {
    if (!node) return;
    traverse(node.left);
    inorder.push(node);
    traverse(node.right);
  }
};
```