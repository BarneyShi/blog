---
title: Leetcode 449 - Serialize and Deserialize BST
date: 2021-12-27 03:31:52
tags:
- binary tree
- bst
---
**`Note:`**
- Background knowledge: based on `preorder` and `inorder`, there is and only is `one BST` that we can derive from.
- Very similar to Leetcode 105. 
- Put preorder and inorder traverse results into a string.
- Convert them back to array then construct the BST tree.

**`Question:`**

Serialization is converting a data structure or object into a sequence of bits so that it can be stored in a file or memory buffer, or transmitted across a network connection link to be reconstructed later in the same or another computer environment.

Design an algorithm to serialize and deserialize a `binary search tree`. There is no restriction on how your serialization/deserialization algorithm should work. You need to ensure that a binary search tree can be serialized to a string, and this string can be deserialized to the original tree structure.

The `encoded` string should be as compact as possible.

**`Example:`**
```
Input: root = [2,1,3]
Output: [2,1,3]
```

**`Code:`**
```javascript
/**
 * Definition for a binary tree node.
 * function TreeNode(val) {
 *     this.val = val;
 *     this.left = this.right = null;
 * }
 */

/**
 * Encodes a tree to a single string.
 *
 * @param {TreeNode} root
 * @return {string}
 */
var serialize = function(root) {
  if (!root) return null;
  let inorder = [];
  inorderTraverse(inorder, root);
  let preorder = [];
  preorderTraverse(preorder, root);
  return preorder.join('.') + '-' + inorder.join('.');
};

function inorderTraverse(path, node) {
  if (!node) return;
  inorderTraverse(path, node.left);
  path.push(node.val);
  inorderTraverse(path, node.right);
}

function preorderTraverse(path, node) {
  if (!node) return;
  path.push(node.val);
  preorderTraverse(path, node.left);
  preorderTraverse(path, node.right);
}


/**
 * Decodes your encoded data to tree.
 *
 * @param {string} data
 * @return {TreeNode}
 */
var deserialize = function(data) {
  if (!data) return null;
  const str = data.split('-');  
  const preorder = str[0].split('.');
  const inorder = str[1].split('.');
  return construct(preorder, inorder);
};

function construct(preorder, inorder) {
  if (preorder.length === 0) return null;
  const root = preorder.shift();
  const rootIndexInorder = inorder.indexOf(root);
  const leftPreorder = preorder.slice(0, rootIndexInorder);
  const rightPreorder = preorder.slice(rootIndexInorder);
  const leftInorder = inorder.slice(0, rootIndexInorder);
  const rightInorder = inorder.slice(rootIndexInorder + 1);
  let node = new TreeNode(root);
  const left = construct(leftPreorder, leftInorder);
  const right = construct(rightPreorder, rightInorder);
  node.left = left;
  node.right = right;
  return node;
}

/**
 * Your functions will be called as such:
 * deserialize(serialize(root));
 */
```