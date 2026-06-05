---
title: Leetcode 94 - Binary tree inorder traversal
date: 2021-08-18 23:05:20
tags:
- leetcode
- tree
- in-order
---
**Note:** Inorder traversal is to traverse in `left node right` order. Just **TRUST the natural recursion** and don't think about it too much.

**`Recursive`**:
```javascript
var inorderTraversal = function(root) {
  let arr = [];
  if(!root) {
    return arr;
  }
  function inorder(node) {
    node.left && inorder(node.left);
    arr.push(node.val);
    node.right && inorder(node.right);
  }
  inorder(root);
  return arr;
};
```
**`Iterative`**:
```javascript
function inorderTraversal(root, result = []) {
  et stack = [];
  let cur = root;
  while (stack.length || cur) {
    if (cur) {
      // If left subtree exists, let go deeper!
      stack.push(cur);
      cur = cur.left;
    } else {
      // Three is no more left subtree. We need to record `cur.val` then turn to the right subtree.
      let node = stack.pop();
      result.push(node.val);
      cur = node.right;
    }
  }
  return result;
}
```