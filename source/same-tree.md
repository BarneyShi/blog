---
title: Leetcode 100 - Same tree
date: 2021-09-02 22:12:40
tags:
- leetcode
- bfs
---
Given the roots of two binary trees p and q, write a function to check if they are the same or not.

Two binary trees are considered the same if they are structurally identical, and the nodes have the same value.

**Example:**

![img](https://assets.leetcode.com/uploads/2020/12/20/ex1.jpg)
```
Input: p = [1,2,3], q = [1,2,3]
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
 * @param {TreeNode} p
 * @param {TreeNode} q
 * @return {boolean}
 */
var isSameTree = function(p, q) {
  if (p == null && q == null) return true;
  if (p == null || q == null) return false;
  
  return p.val === q.val && isSameTree(p.left, q.left) && isSameTree(p.right, q.right);
};
```
**A naive way using BFS**
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
 * @param {TreeNode} p
 * @param {TreeNode} q
 * @return {boolean}
 */
var isSameTree = function(p, q) {
  let traversal_p = [];
  let traversal_q = [];
  bfs(p, traversal_p);
  bfs(q, traversal_q);
  return traversal_p.toString() == traversal_q.toString();
  
  function bfs(node, arr) {
    if (!node) {
      arr.push(null);
      return;
    }
    if (node) {
      arr.push(node.val);
    }
    bfs(node.left, arr);
    bfs(node.right, arr);
  }
};
```
