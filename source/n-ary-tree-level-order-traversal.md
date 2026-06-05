---
title: Leetcode 429 - N-ary tree level order traversal
date: 2021-09-16 00:02:56
tags:
- leetcode
- binary tree
---

**`Note`**
- Can be easily solved using `level order` traversal.

**Example**

![img](https://assets.leetcode.com/uploads/2018/10/12/narytreeexample.png)
```
Input: root = [1,null,3,2,4,null,5,6]
Output: [[1],[3,2,4],[5,6]]
```

```javascript
/**
 * // Definition for a Node.
 * function Node(val,children) {
 *    this.val = val;
 *    this.children = children;
 * };
 */

/**
 * @param {Node|null} root
 * @return {number[][]}
 */
var levelOrder = function(root) {
  let result = [];
  if (!root) return result;
  let queue = [root];
  
  while (queue.length) {
    let length = queue.length;
    let curLevel = [];
    for (let i = 0; i < length; i++) {
      let node = queue.shift();
      curLevel.push(node.val);
      node.children && node.children.map(child => {
        queue.push(child);
      })
    }
    result.push(curLevel);
  }
  return result;
};
```