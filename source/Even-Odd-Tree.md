---
title: Leetcode 1609 - Even Odd Tree
date: 2021-12-24 18:01:41
tags:
- binary tree
- bfs
---
**`Note:`**
- Classic level-order traversal problem.
- Use queue.

**`Question:`**

A binary tree is named `Even-Odd` if it meets the following conditions:

- The root of the binary tree is at level index `0`, its children are at level index `1`, their children are at level index `2`, etc.
- For every `even-indexed` level, all nodes at the level have odd integer values in `strictly increasing` order (from left to right).
- For every `odd-indexed` level, all nodes at the level have even integer values in `strictly decreasing` order (from left to right).

Given the `root` of a binary tree, return `true` if the binary tree is Even-Odd, otherwise return `false`.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2020/09/15/sample_1_1966.png)
```
Input: root = [1,10,4,3,null,7,9,12,8,6,null,null,2]
Output: true
Explanation: The node values on each level are:
Level 0: [1]
Level 1: [10,4]
Level 2: [3,7,9]
Level 3: [12,8,6,2]
Since levels 0 and 2 are all odd and increasing and levels 1 and 3 are all even and decreasing, the tree is Even-Odd.
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
 * @return {boolean}
 */
var isEvenOddTree = function(root) {
  let queue = [root];
  let level = 0;
  while (queue.length > 0) {
    const length = queue.length;
    let prev;
    for (let i = 0; i < length; i++) {
      const head = queue.shift();
      if (level % 2 === 0 && head.val % 2 === 0 || level % 2 === 1 && head.val % 2 === 1) return false;
      if (prev === undefined) {
        prev = head.val;
      } else {
        if (level % 2 === 0 && head.val <= prev || level % 2 === 1 && head.val >= prev) return false;
        prev = head.val;
      }
      if (head.left) queue.push(head.left);
      if (head.right) queue.push(head.right);
    }
    level++;
  }
  return true;
};
```