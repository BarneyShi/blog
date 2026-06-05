---
title: Leetcode 501 - Find mode in BST
date: 2021-09-29 23:22:47
tags:
- binary tree
---
**`Note:`**
- To avoid iterating the tree twice (1st is building it, 2nd is find the most frequent occurence), we should find the result while traversing! - Use `inorder` becasue it will return a sorted array.
- We set up `count`, `maxCount`, `current` to store states.
  - When `node.val === current`:
    - `count > maxCount`, then clear the `result` array and push the new max. Also remember to update `current`
    - `count === maxCount`, push node.val into result.
  - When `node.val !== current`:
    - `node` is the first node (root), just push it into result.
    - All element in `result` only appear `once`, so just the current one. 

Given the root of a binary search tree (BST) with duplicates, return all the mode(s) (i.e., the most frequently occurred element) in it.

If the tree has more than one mode, return them in any order.

Assume a BST is defined as follows:

- The left subtree of a node contains only nodes with keys less than or equal to the node's key.
- The right subtree of a node contains only nodes with keys greater than or equal to the node's key.
- Both the left and right subtrees must also be binary search trees.

**`Example`**

![img](https://assets.leetcode.com/uploads/2021/03/11/mode-tree.jpg)
```
Input: root = [1,null,2,2]
Output: [2]
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
 * @return {number[]}
 */
var findMode = function(root) {
  let result = [];
  let current = null;
  let count = 0;
  let maxCount = 0;

  traverse(root);
  return result;

  function traverse(node) {
    if (!node) return;
    node.left && traverse(node.left);

    // !!
    if (current === node.val) {
      count++;
      if (count > maxCount) {
        maxCount = count;
        result = [];
        result.push(node.val);
      } else if (count === maxCount) {
        result.push(node.val);
      }
    } else {
      count = 1;
      current = node.val;
      maxCount = Math.max(1, maxCount);
      if (result.length === 0 || maxCount === 1) result.push(node.val);
    }

    node.right && traverse(node.right);
  }
};
```