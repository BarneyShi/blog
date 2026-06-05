---
title: Leetcode 107 - Binary tree level order traversal II
date: 2021-09-15 22:13:28
tags:
- leetcode
- binary tree
---
**`Note`**:
- Very similar to Leetcode 102, but we just need to `reverse` the result.

Given the root of a binary tree, return the bottom-up level order traversal of its nodes' values. (i.e., from left to right, level by level from leaf to root).

**Example**

![img](https://assets.leetcode.com/uploads/2021/02/19/tree1.jpg)
```
Input: root = [3,9,20,null,null,15,7]
Output: [[15,7],[9,20],[3]]
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
var levelOrderBottom = function(root) {
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
  return result.reverse();
};
```