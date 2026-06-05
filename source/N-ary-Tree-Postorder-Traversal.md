---
title: Leetcode 590 - N-ary Tree Postorder Traversal
date: 2021-12-07 19:40:49
tags:
- tree
---
**`Note:`**
- Because preorder adding order is `node, left, right`.
- If we make it `node, right, left`, then reverse the final `res[]`. Then it's `postOrder` traversal.

**`Question:`**

Given the `root` of an n-ary tree, return the postorder traversal of its nodes' values.

Nary-Tree input serialization is represented in their level order traversal. Each group of children is separated by the null value (See examples)

**`Example:`**

![img](https://assets.leetcode.com/uploads/2018/10/12/narytreeexample.png)
```
Input: root = [1,null,3,2,4,null,5,6]
Output: [5,6,3,2,4,1]
```

**`Code:`**

**`Iterative`**
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
 * @return {number[]}
 */
var postorder = function(root) {
  if (!root) return [];
  let res = [];
  let stack = [root];
  while (stack.length > 0) {
    const top = stack.pop();
    res.push(top.val);
    const children = top.children;
    while (children.length > 0) {
      const node = children.shift();
      stack.push(node);
    }
  }
  return res.reverse();
};
```

**`Recursive`**
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
 * @return {number[]}
 */
var postorder = function(root) {
  let res = [];
  dfs(root);
  return res;
  
  function dfs(node) {
    if (!node) return;
    const children = node.children;
    for (const child of children) {
      dfs(child);
    }
    res.push(node.val);
  }
};
```