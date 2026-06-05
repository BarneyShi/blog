---
title: Leetcode 104 - Maximum depth of binary tree
date: 2021-09-16 00:46:40
tags:
- leetcode
- binary tree
---
**`Note`**
- Use recursion is quicker.
- Because we are returning a `number`. The termination condition must `return 0`.

Given the root of a binary tree, return its maximum depth.

A binary tree's maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

**Example**

![img](https://assets.leetcode.com/uploads/2020/11/26/tmp-tree.jpg)
```
Input: root = [3,9,20,null,null,15,7]
Output: 3
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
var maxDepth = function(root) {
  if (!root) return 0;
  return Math.max(maxDepth(root.left) + 1, maxDepth(root.right) + 1);
};
```