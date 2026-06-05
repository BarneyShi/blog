---
title: Leetcod 102 - Binary tree level order traversal
date: 2021-09-15 21:35:16
tags:
- leetcode
- binary tree
---
**`Note`**:
- Use iterative way.
- Use `queue` data structure and `shift()` function to get the first element.

Given the root of a binary tree, return the level order traversal of its nodes' values. (i.e., from left to right, level by level).

**Example**

![img](https://assets.leetcode.com/uploads/2021/02/19/tree1.jpg)
```
Input: root = [3,9,20,null,null,15,7]
Output: [[3],[9,20],[15,7]]
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
 * @return {number[][]}
 */
var levelOrder = function(root) {
  let queue = [root];
  let result = [];
  if (!root) return result;
  while (queue.length) {
    let curLevel = [];
    let length = queue.length;
    for (let i = 0; i < length; i++) {
      let node = queue.shift();
      curLevel.push(node.val);
      node.left && queue.push(node.left);
      node.right && queue.push(node.right);
    }
    result.push(curLevel);
  }
  return result;
};
```