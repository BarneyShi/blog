---
title: Leetcode 589 - N-ary tree preorder traversal
date: 2021-12-06 23:33:08
tags:
- tree
---
**`Note:`**
- Recursive way is too easy, let's user iterative.
- Use `stack`.
- Add children backwards using `pop()`.

**`Question:`**

Given the root of an `n-ary` tree, return the preorder traversal of its nodes' values.

Nary-Tree input serialization is represented in their level order traversal. Each group of children is separated by the null value (See examples)

**`Example:`**

![img](https://assets.leetcode.com/uploads/2018/10/12/narytreeexample.png)
```
Input: root = [1,null,3,2,4,null,5,6]
Output: [1,3,5,6,2,4]
```

**`Code:`**
```javascript
/**
 * // Definition for a Node.
 * function Node(val, children) {
 *    this.val = val;
 *    this.children = children;
 * };
 */

/**
 * @param {Node|null} root
 * @return {number[]}
 */
var preorder = function(root) {
  if (!root) return [];
  let stack = [root];
  let res = [];
  while (stack.length > 0) {
    const top = stack.pop();
    res.push(top.val);
    const children = top.children;
    while (children.length > 0) {
      stack.push(children.pop());
    }
  }
  return res;
};
```