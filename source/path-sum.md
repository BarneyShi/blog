---
title: Leetcode 112 - Path sum
date: 2021-09-28 17:36:05
tags:
- binary tree
---
**`Note:`**
- Backtracking is easy but slower. 
- Recursion is quicker and it's intuitive to use `||` operator.

Given the root of a binary tree and an integer targetSum, return true if the tree has a root-to-leaf path such that adding up all the values along the path equals targetSum.

A leaf is a node with no children.

**Example**

![img](https://assets.leetcode.com/uploads/2021/01/18/pathsum1.jpg)
```
Input: root = [5,4,8,11,null,13,4,7,2,null,null,null,1], targetSum = 22
Output: true
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
 * @return {boolean}
 */
var hasPathSum = function(root, targetSum) {
  let result = false;
  if (!root) return result;
  backtracking(root, 0);
  return result;
  
  function backtracking(node, sum) {
    if (!node.left && !node.right) {
      sum += node.val;
      if (sum === targetSum) result = true;
    }
    if (node.left) {
      sum += node.val;
      backtracking(node.left, sum)
      sum -= node.val;
    }
    if (node.right) {
      sum += node.val;
      backtracking(node.right, sum);
      sum -= node.val;
    }
  }
};
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
 * @return {boolean}
 */
var hasPathSum = function(root, targetSum) {
  return recursion(root, 0);
  function recursion(node, sum) {
    if (!node) return false;
    if (!node.left && !node.right && sum + node.val === targetSum) return true;
    return recursion(node.left, sum + node.val) || recursion(node.right, sum + node.val);
  }
};
```
