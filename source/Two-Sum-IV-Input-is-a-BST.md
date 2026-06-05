---
title: Leetcode 653 - Two Sum IV - Input is a BST
date: 2021-12-13 02:26:59
tags:
- bst
- double pointers
---
**`Note:`**
- Use `inorder` to get a sorted array then use `double pointers`.

**`Question:`**

Given the `root` of a Binary Search Tree and a target number `k`, return `true` if there exist two elements in the BST such that their sum is equal to the given target.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2020/09/21/sum_tree_1.jpg)
```
Input: root = [5,3,6,2,4,null,7], k = 9
Output: true
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
 * @param {number} k
 * @return {boolean}
 */
var findTarget = function (root, k) {
  let traversal = [];
  dfs(root);
  let left = 0, right = traversal.length - 1;
  while (left < right) {
    const sum = traversal[left] + traversal[right];
    if (sum === k) return true;
    if (sum > k) {
      right--;
    } else {
      left++;
    }
  }
  return false;

  function dfs(node) {
    if (!node) return;
    dfs(node.left);
    traversal.push(node.val);
    dfs(node.right);
  }
};
```