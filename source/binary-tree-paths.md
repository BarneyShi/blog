---
title: Leetcode 257 - Binary tree paths
date: 2021-09-28 03:11:29
tags:
- binary tree
---
**`Note`**
- Know how to check if a node is a `leaf node`
- Use spread operator to `pass by value` (Otherwise changing an element of the array would propagate back to the original array)

Given the root of a binary tree, return all root-to-leaf paths in any order.

A leaf is a node with no children.

**Example**

![img](https://assets.leetcode.com/uploads/2021/03/12/paths-tree.jpg)
```
Input: root = [1,2,3,null,5]
Output: ["1->2->5","1->3"]
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
 * @return {string[]}
 */
var binaryTreePaths = function(root) {
  let result = [];
  traverse(root, []);
  result = result.map(arr => arr.join('->'));
  return result;
  function traverse(node, path) {
    if (!node.left && !node.right) {
      path.push(node.val);
      result.push([...path]);
      return;
    }
    path.push(node.val);
    node.left && traverse(node.left, [...path]);
    node.right && traverse(node.right, [...path]);
  }
};
```

**`Backtracking`**
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
 * @return {string[]}
 */
var binaryTreePaths = function(root) {
  let result = [];
  backtracking(root, []);
  result = result.map(arr => arr.join('->'));
  return result;
  
  function backtracking(node, path) {
    if (!node.left && !node.right) {
      path.push(node.val);
      result.push([...path]);
      return;
    }
    path.push(node.val);
    if (node.left) {
      backtracking(node.left, path);
      /* BACKTRACKING */
      path.pop();
    }
    if (node.right) {
      backtracking(node.right, path);
      /* BACKTRACKING */
      path.pop();
    }
  }
};
```