---
title: Leetcode 173 - BST iterator
date: 2021-11-30 17:31:09
tags:
- bst
---
**`Note:`**
- `BST`'s `in-order` traversal is a sorted array.

**`Question:`**

Implement the `BSTIterator` class that represents an iterator over the `in-order` traversal of a binary search tree (BST):

- `BSTIterator(TreeNode root)` Initializes an object of the BSTIterator class. The root of the BST is given as part of the constructor. The pointer should be initialized to a non-existent number smaller than any element in the BST.
- `boolean hasNext()` Returns true if there exists a number in the traversal to the right of the pointer, otherwise returns false.
- `int next()` Moves the pointer to the right, then returns the number at the pointer.

Notice that by initializing the pointer to a non-existent smallest number, the first call to `next()` will return the smallest element in the BST.

You may assume that `next()` calls will always be valid. That is, there will be at least a next number in the in-order traversal when next() is called.

**`Example:`**
![img](https://assets.leetcode.com/uploads/2018/12/25/bst-tree.png)
```
Input
["BSTIterator", "next", "next", "hasNext", "next", "hasNext", "next", "hasNext", "next", "hasNext"]
[[[7, 3, 15, null, null, 9, 20]], [], [], [], [], [], [], [], [], []]
Output
[null, 3, 7, true, 9, true, 15, true, 20, false]
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
 */
var BSTIterator = function(root) {
  let nodes = [];
  inOrder(root);
  this.chidlren = nodes;

  function inOrder(node) {
    if (!node) return;
    inOrder(node.left);
    nodes.push(node.val);
    inOrder(node.right);
  }
};

/**
 * @return {number}
 */
BSTIterator.prototype.next = function() {
  return this.chidlren.shift();
};

/**
 * @return {boolean}
 */
BSTIterator.prototype.hasNext = function() {
  return this.chidlren.length > 0;
};

/**
 * Your BSTIterator object will be instantiated and called as such:
 * var obj = new BSTIterator(root)
 * var param_1 = obj.next()
 * var param_2 = obj.hasNext()
 */
```