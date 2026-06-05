---
title: Leetcode 700 - Search in a binary search tree
date: 2021-11-25 15:16:58
tags:
- dfs
- bst
- binary tree
---
**`Note:`**
- Use `dfs`
- Know BST's left subtree vals are smaller than root node val.

**`Question:`**

You are given the `root` of a binary search tree (`BST`) and an integer `val`.

Find the node in the BST that the node's value equals `val` and return the subtree rooted with that node. If such a node does not exist, return `null`.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2021/01/12/tree1.jpg)
```
Input: root = [4,2,7,1,3], val = 2
Output: [2,1,3]
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
 * @param {number} val
 * @return {TreeNode}
 */
var searchBST = function(root, val) {
  if (!root) return null;
  if (root.val === val) return root;
  if (root.val > val) return searchBST(root.left, val);
  return searchBST(root.right, val);
};
```