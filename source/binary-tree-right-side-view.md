---
title: Leetcode 199 - Binary tree right side view
date: 2021-09-15 23:45:12
tags:
- binary tree
---
**`Note`**:
- Don't used recursion because you don't know the right most node is a left node or right node.

Given the root of a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.

**Example**

![img](https://assets.leetcode.com/uploads/2021/02/14/tree.jpg)
```
Input: root = [1,2,3,null,5,null,4]
Output: [1,3,4]
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
var rightSideView = function(root) {
  let result = [];
  if (!root) return result;
  let queue = [root];
  while (queue.length) {
    let length = queue.length;
    for (let i = 0; i < length; i++) {
      let node = queue.shift();
      if (i === length-1) result.push(node.val);
      node.left && queue.push(node.left);
      node.right && queue.push(node.right);
    }
  }
  return result;
};
```