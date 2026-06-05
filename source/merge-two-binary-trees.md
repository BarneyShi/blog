---
title: Leetcode 617 - Merge two binary trees
date: 2021-09-29 17:43:48
tags:
- binary tree
---
**`Note:`**
- A very typical recursion problem.

You are given two binary trees root1 and root2.

Imagine that when you put one of them to cover the other, some nodes of the two trees are overlapped while the others are not. You need to merge the two trees into a new binary tree. The merge rule is that if two nodes overlap, then sum node values up as the new value of the merged node. Otherwise, the NOT null node will be used as the node of the new tree.

Return the merged tree.

Note: The merging process must start from the root nodes of both trees.

**`Example`**
![img](https://assets.leetcode.com/uploads/2021/02/05/merge.jpg)
```
Input: root1 = [1,3,2,5], root2 = [2,1,3,null,4,null,7]
Output: [3,4,5,5,4,null,7]
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
 * @param {TreeNode} root1
 * @param {TreeNode} root2
 * @return {TreeNode}
 */
var mergeTrees = function(root1, root2) {
  if (!root1 && !root2) return null;
  const node = new TreeNode(0);
  node.val = (root1 ? root1.val : 0) + (root2 ? root2.val : 0);
  node.left = mergeTrees(root1?.left, root2?.left);
  node.right = mergeTrees(root1?.right, root2?.right);
  
  return node;
};
```