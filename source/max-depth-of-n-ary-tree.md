---
title: Leetcode 559 - Max depth of n-ary tree
date: 2021-11-20 16:46:09
tags:
- binary tree
- dfs
---
**`Note:`**
- Input is not an array, it's still a root node but shown in a serialized array.
- Do DFS on each child in `children`
- Do `Max` on result of each `dfs(child)`.

**`Question:`**

Given a n-ary tree, find its maximum depth.

The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

Nary-Tree input serialization is represented in their level order traversal, each group of children is separated by the null value (See examples).

**`Example:`**
![img](https://assets.leetcode.com/uploads/2018/10/12/narytreeexample.png)
```
Input: root = [1,null,3,2,4,null,5,6]
Output: 3
```

**`Code:`**
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
 * @return {number}
 */
var maxDepth = function(root) {
  if (!root) return 0;
  return dfs(root) + 1;

  function dfs(node) {
    if (!node) return 0;
    const children = node.children;
    let res = 0;
    for (const child of children) {
      res = Math.max(res, 1 + dfs(child));
    }
    return res;
  }
};
```