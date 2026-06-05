---
title: Leetcode 572 - Subtree of another tree
date: 2021-09-16 23:00:46
tags:
- leetcode
- binary tree
---
**`Note`**:
- Need a helper `isSameTree`
- Recursively to check if `isSame(node, subRoot)` is true.

Given the roots of two binary trees root and subRoot, return true if there is a subtree of root with the same structure and node values of subRoot and false otherwise.

A subtree of a binary tree tree is a tree that consists of a node in tree and all of this node's descendants. The tree tree could also be considered as a subtree of itself.

**Example**

![img](https://assets.leetcode.com/uploads/2021/04/28/subtree1-tree.jpg)
```
Input: root = [3,4,5,1,2], subRoot = [4,1,2]
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
 * @param {TreeNode} subRoot
 * @return {boolean}
 */
var isSubtree = function(root, subRoot) {
  // if (!root && !subRoot) return true;
  // if (!root && subRoot || root && !subRoot) return false;
  if (!root) return false;
  if (isSameTree(root, subRoot)) return true;
  return isSubtree(root.left, subRoot) || isSubtree(root.right, subRoot);
}; 

function isSameTree(t1, t2) {
  if (!t1 && !t2) return true;
  if (!t2 || !t1) return false;
  return t1.val === t2.val && isSameTree(t1.left, t2.left) && isSameTree(t1.right, t2.right);
}
```