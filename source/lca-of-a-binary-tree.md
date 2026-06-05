---
title: Leetcode 236 - LCA of a binary tree
date: 2021-10-01 16:36:19
tags:
- binary tree
---
**`Note:`**
- Base: `root` is null, p, or r, just return it.
- Do recursion on both `left` and `right` subtree.
  - If we find both `left` and `right`, it means the current `root` is LCA.
  - IF we only find either `left` or `right`, it means they are in the same subtree, and what the recursion returns is the LCA.

Given a binary tree, find the lowest common ancestor (LCA) of two given nodes in the tree.

According to the definition of LCA on Wikipedia: “The lowest common ancestor is defined between two nodes p and q as the lowest node in T that has both p and q as descendants (where we allow a node to be a descendant of itself).”

**Example**

![img](https://assets.leetcode.com/uploads/2018/12/14/binarytree.png)
```
Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
Output: 3
Explanation: The LCA of nodes 5 and 1 is 3.
```

```javascript
/**
 * Definition for a binary tree node.
 * function TreeNode(val) {
 *     this.val = val;
 *     this.left = this.right = null;
 * }
 */
/**
 * @param {TreeNode} root
 * @param {TreeNode} p
 * @param {TreeNode} q
 * @return {TreeNode}
 */
var lowestCommonAncestor = function(root, p, q) {
  if (root === null || root === p || root === q) return root;
  let left;
  let right;
  if (root.left) {
    left = lowestCommonAncestor(root.left, p, q)
  }
  if (root.right) {
    right = lowestCommonAncestor(root.right, p, q);
  }
  let result;
  if (left && right) return root;
  if (!left && right) return right;
  if (left && !right) return left;
};
```