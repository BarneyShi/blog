---
title: Leetcode 145 - Binary tree postorder traversal
date: 2021-09-15 03:14:12
tags:
- binary tree
- post-order
---
Given the root of a binary tree, return the postorder traversal of its nodes' values.
**Example**

![img](https://assets.leetcode.com/uploads/2020/08/28/pre1.jpg)
```
Input: root = [1,null,2,3]
Output: [3,2,1]
```
**`Iterative`**:
```javascript
var postorderTraversal = function(root, result = []) {
  if (!root) return result;
  let stack = [root];
  let cur = null;
  while (stack.length) {
    cur = stack.pop();
    result.push(cur.val);
    cur.left && stack.push(cur.left);
    cur.right && stack.push(cur.right);
  }
  return result.reverse();
};
```

**`Recursive`**
```javascript
var postorderTraversal = function(root) {
  let result = [];
  dfs(root, result);
  return result;
};
function dfs(root, result) {
  if (!root) return;
  dfs(root.left, result);
  dfs(root.right, result);
  result.push(root.val);
}
```