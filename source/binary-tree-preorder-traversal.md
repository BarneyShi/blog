---
title: Leetcode 144 - Binary tree preorder traversal
date: 2021-09-14 23:06:40
tags:
- binary tree
- dfs
- pre-order
---
Given the root of a binary tree, return the preorder traversal of its nodes' values.

**Example**

![img](https://assets.leetcode.com/uploads/2020/09/15/inorder_1.jpg)
```
Input: root = [1,null,2,3]
Output: [1,2,3]
```
**`Recursion`**:
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
var preorderTraversal = function(root) {
  let ans = [];
  dfs(root, ans);
  return ans;
};

function dfs(root, result) {
  if (!root) {
    return;
  }
  result.push(root.val);
  dfs(root.left, result);
  dfs(root.right, result);
}
```

**`Iteratiion`**:
```javascript
  var preorderTraversal = function(root, result = []) {
    let stack = [root];
    while (stack.length) {
      let cur = stack.pop();
      result.push(cur.val);
      preorderTraversal(root.left, result);
      preorderTraversal(root.right, result);
    }
    return result;
  }
```