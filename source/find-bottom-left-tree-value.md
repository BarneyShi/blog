---
title: Leetcode 513 - Find bottom left tree value
date: 2021-09-28 17:03:42
tags:
- binary tree
---
**`Note:`**
- `Level order traversal` makes this question quite easier.

Given the root of a binary tree, return the leftmost value in the last row of the tree.

**Example**

![img](https://assets.leetcode.com/uploads/2020/12/14/tree1.jpg)
```
Input: root = [2,1,3]
Output: 1
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
 * @return {number}
 */
var findBottomLeftValue = function(root) {
  let result = 0;
  let queue = [root];
  
  while(queue.length) {
    result = queue[0].val;
    let length = queue.length;
    for (let i = 0; i < length; i++) {
      let tmp = queue.shift();
      tmp.left && queue.push(tmp.left);
      tmp.right && queue.push(tmp.right);
    }
  }
  return result;
};
```
