---
title: Leetcode 700 - Search in a binary search tree
date: 2021-09-29 17:59:26
tags:
- binary tree
---
**`Note:`**
- Because it's a binary search tree, we can decide whethere go `left` or `right` based on `val`. It'll save lots of time instead of traversing all the nodes.
- Use a `flag` to tell recursion that we've found a result so no more recursion.

You are given the root of a binary search tree (BST) and an integer val.

Find the node in the BST that the node's value equals val and return the subtree rooted with that node. If such a node does not exist, return null.

**`Example`**

![img](https://assets.leetcode.com/uploads/2021/01/12/tree1.jpg)
```
Input: root = [4,2,7,1,3], val = 2
Output: [2,1,3]
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
 * @param {number} val
 * @return {TreeNode}
 */
var searchBST = function(root, val) {
  let result = null;
  let find = false;
  traverse(root);
  return result;
  
  function traverse(node) {
    if (!node || find) return;
    if (node.val === val) {
      result = node;
      find = true;
      return;
    }
    if (node.val > val) traverse(node.left);
    if (node.val < val) traverse(node.right);
  }
};
```