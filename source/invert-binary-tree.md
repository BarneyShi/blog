---
title: Leetcode 226 - Invert binary tree
date: 2021-09-15 21:03:17
tags:
- binary tree
---
Given the root of a binary tree, invert the tree, and return its root.

**Example**:
![img](https://assets.leetcode.com/uploads/2021/03/14/invert1-tree.jpg)
```
Input: root = [4,2,7,1,3,6,9]
Output: [4,7,2,9,6,3,1]
```
**`Recusion`**:
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
 * @return {TreeNode}
 */
var invertTree = function(root) {
  let result = [];
  invert(root, result);
  return root;
}
function invert(root, result) {
  if (!root) {
    return;
  }
  let tmp = root.left;
  root.left = root.right;
  root.right = tmp;
  invert(root.right, result);
  invert(root.left, result);
}
```
**`Iteration`**:
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
 * @return {TreeNode}
 */
var invertTree = function(root) {
  if (!root) return root;
  let stack = [root];
  let cur = null;
  while (stack.length) {
    cur = stack.pop();
    let tmp = cur.left;
    cur.left = cur.right;
    cur.right = tmp;
    cur.right && stack.push(cur.right);
    cur.left && stack.push(cur.left);
  }
  return root;
};
```