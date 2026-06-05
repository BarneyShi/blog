---
title: Leetcode 101/100 - Symmetric tree / Same tree
date: 2021-09-16 22:01:58
tags:
- leetcode
- binary tree
---
**`Note`**
- Intuitive way is to use `recursion`.
- There are three situations
  - Both are `null`, which means left subtree and right subtree are the same.
  - One of them is null, so it's false
  - Both are not null, then we need recursion, comapre `val` first then use `&&`. Be careful that we need to compare `left.left, right.right` and `left.right, right.left`.

Given the root of a binary tree, check whether it is a mirror of itself (i.e., symmetric around its center).

**Example**

![img](https://assets.leetcode.com/uploads/2021/02/19/symtree1.jpg)
```
Input: root = [1,2,2,3,4,4,3]
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
 * @return {boolean}
 */
var isSymmetric = function(root) {
  if (!root) return true;
  return compare(root.left, root.right);
}; 

function compare(left, right) {
  if (!left && !right) return true;
  if (left && !right || !left && right) return false;
  return left.val === right.val && compare(left.left, right.right) && compare(left.right, right.left);
}
```