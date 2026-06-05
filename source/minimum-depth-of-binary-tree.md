---
title: Leetcode 111 - Minimum depth of binary tree
date: 2021-09-16 01:21:11
tags:
- leetcode
- binary tree
---
**`Note`**
- Don't really need `level order` traversal.
- Be careful of the `termination condition`: return `1` when both `root.left` and `root.right` are `null`. (1 because we need the number of nodes but not just depth)
- Three situations to consider
  - Have both left and right child.
  - Only left node.
  - Only right node.

Given a binary tree, find its minimum depth.

The minimum depth is the number of nodes along the shortest path from the root node down to the nearest leaf node.

Note: A leaf is a node with no children.

**Example**

![img](https://assets.leetcode.com/uploads/2020/10/12/ex_depth.jpg)
```
Input: root = [3,9,20,null,null,15,7]
Output: 2
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
var minDepth = function(root) {
  if (!root) return 0;
  if (!root.left && !root.right ) return 1;
  if (root.left && root.right) return 1 + Math.min(minDepth(root.left), minDepth(root.right));
  if (root.left) return 1 + minDepth(root.left);
  if (root.right) return 1 + minDepth(root.right);
};
```