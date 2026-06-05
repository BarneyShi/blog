---
title: Leetcode 543 - Diameter of binary tree
date: 2021-10-22 01:27:10
tags:
- binary tree
- dfs
---
**`Note:`**
- It doesn't feel like an easy question.
- Idea: Iterate each node and add its `leftDepth` with `rightDepth` while comparing with `result`.
- Detail: 
  - If left and right subtree both exist, `leftDepth + rightDepth + 1 + 1`.
  - But if one of them doesn't exist, we need to check we add `1` or `0`, like `node.left ? 1 : 0`.


Given the root of a binary tree, return the length of the `diameter` of the tree.

The `diameter` of a binary tree is the `length` of the longest path between any two nodes in a tree. This path may or may not pass through the root.

The length of a path between two nodes is represented by the number of edges between them.

**`Question:`**


**`Example:`**

![img](https://assets.leetcode.com/uploads/2021/03/06/diamtree.jpg)
```
Input: root = [1,2,3,4,5]
Output: 3
Explanation: 3 is the length of the path [4,2,1,3] or [5,2,1,3].
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
var diameterOfBinaryTree = function(root) {
  let result = 0;
  depth(root);
  return result;

  function depth(node) {
    if (!node || !node.left && !node.right) return 0;
    const leftDepth = depth(node.left);
    const rightDepth = depth(node.right);
    result = Math.max((node.left ? 1 : 0) + leftDepth + (node.right ? 1 : 0) + rightDepth, result);
    return 1 + Math.max(leftDepth, rightDepth);
  }
};

```