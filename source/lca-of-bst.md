---
title: Leetcode 235 - LCA of BST
date: 2021-10-01 17:02:58
tags:
- bst
- binary tree
---
**`Note:`**
- Much like 236, use recursion - If `root.val` is between `p.val` and `q.val`, it means we found the result.
- Base: we found the result - `root.val` is in `[p.val, q.val]` (Assume p.val is smaller than q.val)
- If `root.val` is bigger than both of them, then we need to search in smaller values, whcih means we need to get into `left` subtree.
- Likewise, do `right` subtree.

Given a binary search tree (BST), find the lowest common ancestor (LCA) of two given nodes in the BST.

According to the definition of LCA on Wikipedia: “The lowest common ancestor is defined between two nodes p and q as the lowest node in T that has both p and q as descendants (where we allow a node to be a descendant of itself).”

**`Example`**

![img](https://assets.leetcode.com/uploads/2018/12/14/binarysearchtree_improved.png)
```
Input: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 8
Output: 6
Explanation: The LCA of nodes 2 and 8 is 6.
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
  if (root.val >= (p.val > q.val ? q.val : p.val) && root.val <= (p.val < q.val ? q.val : p.val)) return root;
  let result;
  if (root.val < p.val) {
    result = lowestCommonAncestor(root.right, p, q);
  }
  if (root.val > q.val) {
    result = lowestCommonAncestor(root.left, p, q);
  }
  return result;
};
```