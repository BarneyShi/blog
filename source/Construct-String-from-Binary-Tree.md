---
title: Leetcode 606 - Construct String from Binary Tree
date: 2021-12-09 00:06:47
tags:
- dfs
---
**`Note:`**
- Given traveral is in `level order traversal`.
- Normally it'd be quite easy, but when do we need to `omit ()` and when not?
- Ask ourself when do we `need null` in our input?
  - Ans: when we need to tell machine that `left subtree` is `empty` and the `next node` is for `right subtree`.
- So in our recursion, when a `node has no left subtree` but `has right subtree`, we cannot omit `()`.

**`Question:`**

Given the `root` of a binary tree, construct a string consisting of parenthesis and integers from a binary tree with the preorder traversal way, and return it.

Omit all the empty parenthesis pairs that do not affect the one-to-one mapping relationship between the string and the original binary tree.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2021/05/03/cons1-tree.jpg)
```
Input: root = [1,2,3,4]
Output: "1(2(4))(3)"
Explanation: Originally, it needs to be "1(2(4)())(3()())", but you need to omit all the unnecessary empty parenthesis pairs. And it will be "1(2(4))(3)"
```

![img](https://assets.leetcode.com/uploads/2021/05/03/cons2-tree.jpg)
```
Input: root = [1,2,3,null,4]
Output: "1(2()(4))(3)"
Explanation: Almost the same as the first example, except we cannot omit the first parenthesis pair to break the one-to-one mapping relationship between the input and the output.
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
 * @return {string}
 */
var tree2str = function(root) {
  const ans = dfs(root);
  return ans.slice(1, ans.length - 1);

  function dfs(node) {
    if (!node) return '';
    const left = dfs(node.left);
    const right = dfs(node.right);
    // Check if `left` is null.
    return '(' + node.val + (node.right && !node.left ? '()' : left) + right + ')';
  }
};
```