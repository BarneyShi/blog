---
title: Leetcode 105 - Construct binary tree from preorder and inorder traversal
date: 2021-10-21 22:55:56
tags:
- binary tree
- dfs
---
**`Note:`**
- The return value is the root, so we need to return `node` in the recursion function.
- The `first` element of `preorder` is the current `root`.
- Split inorder into left and right subtree by the value of `root`. (All vals are unique)
- Know how to assign `root`'s left and right subtree, then by the `length` of left and right `inorder`, split `preorder` into left and right subtree. 

**`Question:`**

Given two integer arrays `preorder` and `inorder` where preorder is the preorder traversal of a binary tree and inorder is the inorder traversal of the same tree, construct and return the binary tree.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2021/02/19/tree.jpg)
```
Input: preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
Output: [3,9,20,null,null,15,7]
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
 * @param {number[]} preorder
 * @param {number[]} inorder
 * @return {TreeNode}
 */
var buildTree = function (preorder, inorder) {
  return build(preorder, inorder);

  function build(preorderArr, inorderArr) {
    if (preorderArr.length === 0) return null;

    const cur = preorderArr.shift();
    const curNode = new TreeNode(cur);
    const rootIndex = inorderArr.indexOf(cur);
    const leftInOrder = inorderArr.slice(0, rootIndex);
    const rightInOrder = inorderArr.slice(rootIndex + 1);
    const leftPreOrder = preorderArr.slice(0, leftInOrder.length);
    const rightPreOrder = preorderArr.slice(leftInOrder.length);

    curNode.left = build(leftPreOrder, leftInOrder);
    curNode.right = build(rightPreOrder, rightInOrder);
    // Return node as required
    return curNode;
  }
};
```