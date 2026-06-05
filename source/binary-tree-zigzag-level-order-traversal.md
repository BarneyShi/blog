---
title: Leetcode 103 - Binary tree zigzag level order traversal
date: 2021-10-16 23:28:46
tags:
- binary tree
---
**`Note:`**
- BFS traversal
- Use a bool to check level traversal direction.
- The only thing changes is the level list. Use `push` or `unshift` based on the bool.

Given the `root` of a binary tree, return the zigzag level order traversal of its nodes' values. (i.e., from left to right, then right to left for the next level and alternate between).

**`Question:`**


**`Example:`**

![img](https://assets.leetcode.com/uploads/2021/02/19/tree1.jpg)
```
Input: root = [3,9,20,null,null,15,7]
Output: [[3],[20,9],[15,7]]
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
 * @return {number[][]}
 */
var zigzagLevelOrder = function (root) {
  if (!root) return [];
  let isLeftToRight = true;
  let result = [];
  let queue = [root];

  while (queue.length > 0) {
    const length = queue.length;
    let tmp = [];
    for (let i = 0; i < length; i++) {
      let first;
      first = queue.shift();
      if (isLeftToRight) {
        tmp.push(first.val);
      } else {
        tmp.unshift(first.val);
      }
      if (first.left) queue.push(first.left);
      if (first.right) queue.push(first.right);

    }
    result.push(tmp);
    isLeftToRight = !isLeftToRight;
  }
  return result;
};
```