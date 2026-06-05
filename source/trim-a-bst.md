---
title: Leetcode 669 - Trim a BST
date: 2021-10-03 21:13:32
tags:
- binary tree
---
**`Note:`**
- Look out cases in which we need to keep trimming a subtree.
- Recursion:
  - Return value is a node, so base case is `return null` and result is `return root`.
  - Techniques we learned: `root.left = recur(...)`, `root.right = recur(...)`.

Given the `root` of a binary search tree and the lowest and highest boundaries as `low` and `high`, trim the tree so that all its elements lies in [low, high]. Trimming the tree should not change the relative structure of the elements that will remain in the tree (i.e., any node's descendant should remain a descendant). It can be proven that there is a `unique answer`.

Return the root of the trimmed binary search tree. Note that the root may change depending on the given bounds.

**Example:**

![img](https://assets.leetcode.com/uploads/2020/09/09/trim2.jpg)
```
Input: root = [3,0,4,null,2,null,null,1], low = 1, high = 3
Output: [3,2,null,1]
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
 * @param {number} low
 * @param {number} high
 * @return {TreeNode}
 */
var trimBST = function(root, low, high) {
  if (!root) return null;
  if (root.val < low) {
    return trimBST(root.right, low, high); 
  }
  if (root.val > high) {
    return trimBST(root.left, low, high);
  }
  root.left = trimBST(root.left, low, high);
  root.right = trimBST(root.right, low, high);
  return root;
};
```


