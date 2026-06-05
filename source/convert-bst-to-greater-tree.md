---
title: Leetcode 538 - Convert BST to greater tree
date: 2021-10-04 01:56:24
tags:
- binary tree
---
**`Note:`**
- Wasted too much time on a wrong solution even if I knew that I should do `reverse inorder traversal`. Need to pratice more binary tree questions using recursion.
- We just need a global variable `acc` to store sums. That's it.

Given the root of a Binary Search Tree (BST), convert it to a Greater Tree such that every key of the original BST is changed to the original key plus the sum of all keys greater than the original key in BST.

As a reminder, a binary search tree is a tree that satisfies these constraints:

- The left subtree of a node contains only nodes with keys less than the node's key.
- The right subtree of a node contains only nodes with keys greater than the node's key.
- Both the left and right subtrees must also be binary search trees.

**Example**

![img](https://assets.leetcode.com/uploads/2019/05/02/tree.png)
```
Input: root = [4,1,6,0,2,5,7,null,null,null,3,null,null,null,8]
Output: [30,36,21,36,35,26,15,null,null,null,33,null,null,null,8]
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
 * @param {TreeNode} root
 * @return {TreeNode}
 */
var convertBST = function(root) {
  let acc = 0;
  traversal(root);
  return root;
  
  function traversal(node) {
    if(!node) return 0;
    traversal(node.right);
    node.val += acc;
    acc = node.val;
    traversal(node.left);
  }
};
```