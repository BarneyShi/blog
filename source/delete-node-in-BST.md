---
title: Leetcode 450 - Delete node in BST
date: 2021-10-03 16:18:49
tags:
- binary tree
- bst
---
**`Note`**
- It's easy to find the pattern but hard to cover all the cases.
- Replace target with its `right subtree` and then `append` its `left subtree` to its `right subtree`. (Easy, right?)
- Need to learn how to write efficent recursion when we have to return a node. Code like `root.left = recursion(root)` is useful!
- Need to know just by assign a new node to an old node won't change anything. You have to specify their relations by `node1.left = node2`.

Given a root node reference of a BST and a key, delete the node with the given key in the BST. Return the root node reference (possibly updated) of the BST.

Basically, the deletion can be divided into two stages:

- Search for a node to remove.
- If the node is found, delete the node.

**Example**
![img](https://assets.leetcode.com/uploads/2020/09/04/del_node_1.jpg)
```
Input: root = [5,3,6,2,4,null,7], key = 3
Output: [5,4,6,2,null,null,7]
```

**`My solution`** (Not optimal)
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
 * @param {number} key
 * @return {TreeNode}
 */
var deleteNode = function(root, key) {
  if (!root) return root;
  deleteRecur(root);
  return root;
  
  function deleteRecur(node) {
    if (!node) return;
    if (node.val === key) {
      let ori = node.left;
      root = node.right;
      if (!node.right) {
        root = ori;
        return;
      }
      ori && insertLeaf(ori, node.right);
      return;
    }
    if (node.left && node.left.val === key) {
      let originalLeft = node.left.left;
      node.left = node.left.right;
      if (!node.left) {
        node.left = originalLeft;
        return;
      }
      originalLeft && insertLeaf(originalLeft, node.left);
      return;
    }
    if (node.right && node.right.val === key) {
      let originalLeft = node.right.left;
      node.right = node.right.right;
      if (!node.right) {
        node.right = originalLeft;
        return;
      }
      originalLeft && insertLeaf(originalLeft, node.right);
      return;
    }
    if (node.val > key) deleteRecur(node.left);
    if (node.val < key) deleteRecur(node.right);
  }
  
  function insertLeaf(node, tree) {
    if (!tree.left) {
      tree.left = node;
      return;
    }
    insertLeaf(node, tree.left);
  }
};
```

**`Optimal Recursion`**
```javascript
/**
 * https://leetcode-cn.com/problems/delete-node-in-a-bst/solution/miao-dong-jiu-wan-shi-liao-by-terry2020-tc0o/
 * Definition for a binary tree node.
 * function TreeNode(val, left, right) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.left = (left===undefined ? null : left)
 *     this.right = (right===undefined ? null : right)
 * }
 */
/**
 * @param {TreeNode} root
 * @param {number} key
 * @return {TreeNode}
 */
var deleteNode = function(root, key) {
  if (!root) return null;
  if (root.val > key) {
    /* This kind of recursion has be seen many times, need to remember this. */
    root.left = deleteNode(root.left, key);
  } else if (root.val < key) {
    root.right = deleteNode(root.right, key);
  } else {
    if (!root.right) return root.left;
    if (!root.left) return root.right;
    let node = root.right;
    while (node.left) {
      node = node.left;
    }
    node.left = root.left;
    return root.right;
  }
  /* Need to return a node based on the question. */
  return root;
};
```