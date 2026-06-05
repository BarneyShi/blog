---
title: Leetcode 783 - Minimum Distance Between BST Nodes
date: 2021-12-29 02:58:29
tags:
- bst
---
**`Note:`**
- For each node, it's `min diff` must exist between `|val - leftMax|` and `|val - rightMin|`.
- DFS every node, and use while loop to get `rightMost` of leftSubtree, and `leftMost` of rightSubtree.

**`Question:`**

Given the root of a Binary Search Tree (BST), return the minimum difference between the values of any two different nodes in the tree.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2021/02/05/bst1.jpg)
```
Input: root = [4,2,6,1,3]
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
 * @return {number}
 */
var minDiffInBST = function(root) {
  let min = Number.MAX_SAFE_INTEGER;
  dfs(root);
  return min;
  
  function dfs(node) {
    if (!node) return;
    if (node.left) {
      let leftMax = node.left;
      while (leftMax.right) {
        leftMax = leftMax.right;
      }
      min = Math.min(min, Math.abs(node.val - leftMax.val));
    }
    if (node.right) {
      let rightMax = node.right;
      while (rightMax.left) {
        rightMax = rightMax.left;
      }
      min = Math.min(min, Math.abs(node.val - rightMax.val));
    }
    dfs(node.left);
    dfs(node.right);
  }
};
```