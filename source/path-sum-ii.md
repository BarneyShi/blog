---
title: Leetcode 113 - Path sum II
date: 2021-09-28 17:48:28
tags:
- binary tree
---
**`Note`**
- Recursion is pretty intutitive.
- Backtracking - Remember not to add cur node's val multi times.

Given the root of a binary tree and an integer targetSum, return all root-to-leaf paths where the sum of the node values in the path equals targetSum. Each path should be returned as a list of the node values, not node references.

A root-to-leaf path is a path starting from the root and ending at any leaf node. A leaf is a node with no children.

**Example**

![img](https://assets.leetcode.com/uploads/2021/01/18/pathsumii1.jpg)
```
Input: root = [5,4,8,11,null,13,4,7,2,null,null,5,1], targetSum = 22
Output: [[5,4,11,2],[5,8,4,5]]
Explanation: There are two paths whose sum equals targetSum:
5 + 4 + 11 + 2 = 22
5 + 8 + 4 + 5 = 22
```

**`Recursion`**
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
 * @param {number} targetSum
 * @return {number[][]}
 */
var pathSum = function(root, targetSum) {
  let result = [];
  recursion(root, [], 0);
  return result;
  
  function recursion(node, path, sum) {
    if (!node) return;
    if (!node.left && !node.right && sum + node.val === targetSum) {
      path.push(node.val);
      result.push([...path]);
    }
    path.push(node.val);
    recursion(node.left, [...path], sum + node.val);
    recursion(node.right, [...path], sum + node.val);
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
 * @param {number} targetSum
 * @return {number[][]}
 */
var pathSum = function (root, targetSum) {
  if (!root) return [];
  let result = [];
  let path = [root.val];
  backtracking(root, root.val);
  return result;

  function backtracking(node, curSum) {
    if (!node) return;
    if (!node.left && !node.right && curSum === targetSum) {
      result.push([...path]);
      return;
    }
    if (node.left) {
      path.push(node.left.val);
      backtracking(node.left, curSum + node.left.val);
      path.pop();
    }

    if (node.right) {
      path.push(node.right.val);
      backtracking(node.right, curSum + node.right.val);
      path.pop();
    }
  }
};
```