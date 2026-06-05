---
title: Leetcode 106 - Construct binary tree from inorder and postorder traversal
date: 2021-09-28 21:55:05
tags:
- binary tree
---
**`Note`**
- The `last element` of `postorder` is the current `root`.
- Steps
  - Get the `root`
  - Split `inorder` array based on its value, then we have `leftSubtreeInorder` and `rightSubtreeInorder`.
  - Based on the length of them, we can get `leftSubtreePostorder` and `rightSubtreePostorder`.


Given two integer arrays inorder and postorder where inorder is the inorder traversal of a binary tree and postorder is the postorder traversal of the same tree, construct and return the binary tree.

**`Example`**

![img](https://assets.leetcode.com/uploads/2021/02/19/tree.jpg)
```
Input: inorder = [9,3,15,20,7], postorder = [9,15,7,20,3]
Output: [3,9,20,null,null,15,7]
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
 * @param {number[]} inorder
 * @param {number[]} postorder
 * @return {TreeNode}
 */
var buildTree = function(inorder, postorder) {
  return traverse(inorder, postorder);

  function traverse(inorderArr, postorderArr) {
    /* Base situation1: When both arrays are empty */
    if (inorderArr.length === 0 && postorderArr.length === 0) return null;
    
    const rootVal = postorderArr.pop();
    let root = new TreeNode(rootVal);
    /* Base situation2: When only one node left */
    if (postorderArr.length === 0) {
      return root;
    }
    
    const rootIndex = inorderArr.indexOf(rootVal);
    
    let leftInorder = inorderArr.slice(0, rootIndex);
    let rightInorder = inorderArr.slice(rootIndex + 1);    
    let leftPostOrder = postorderArr.slice(0, leftInorder.length);
    let rightPostOrder = postorderArr.slice(leftInorder.length);
    root.left = traverse(leftInorder, leftPostOrder);
    root.right = traverse(rightInorder, rightPostOrder);
    
    return root;
  }
};
```