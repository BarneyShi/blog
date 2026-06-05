---
title: Leetcode 222 - Count complete tree nodes
date: 2021-09-16 23:44:32
tags:
- leetcode
- binary tree
---
**`Note`**
- 

Given the root of a complete binary tree, return the number of the nodes in the tree.

According to Wikipedia, every level, except possibly the last, is completely filled in a complete binary tree, and all nodes in the last level are as far left as possible. It can have between 1 and 2h nodes inclusive at the last level h.

Design an algorithm that runs in less than O(n) time complexity.

**Example**

![img](https://assets.leetcode.com/uploads/2021/01/14/complete.jpg)
```
Input: root = [1,2,3,4,5,6]
Output: 6
```
**`Iteration`**
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
 * @return {number}
 */
var countNodes = function(root) {
  if (!root) return 0;
  let result = 0;
  let queue = [root];
  while (queue.length) {
    let length = queue.length;
    result += length;
    while(length--) {
      let node = queue.shift();
      node.left && queue.push(node.left);
      node.right && queue.push(node.right);
    }
  }
  return result;
};
```

**`Recursion`**
```javascript
/**
 * @param {TreeNode} root
 * @return {number}
 */
var countNodes = function(root) {
  return count(root);
  
  function count(node) {
    if (!node) return 0;
    return 1 + count(node.left) + count(node.right);
  }
};
```