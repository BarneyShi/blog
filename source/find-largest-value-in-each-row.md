---
title: Leetcoe 515 - Find largest value in each row
date: 2021-09-16 00:12:20
tags:
- leetcode
- binary tree
---
**`Note`**
- Use `level order` traversal

Given the root of a binary tree, return an array of the largest value in each row of the tree (0-indexed).
**Example**

![img](https://assets.leetcode.com/uploads/2020/08/21/largest_e1.jpg)
```
Input: root = [1,3,2,5,3,null,9]
Output: [1,3,9]
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
 * @return {number[]}
 */
var largestValues = function(root) {
  let result = [];
  if (!root) return result;
  let queue = [root];
  
  while (queue.length) {
    let length = queue.length;
    let biggest = -(2**31) - 1;
    for (let i = 0; i < length; i++) {
      let node = queue.shift();
      if (node.val > biggest) biggest = node.val;
      node.left && queue.push(node.left);
      node.right && queue.push(node.right);
    }
    result.push(biggest);
  }
  return result;
};
```