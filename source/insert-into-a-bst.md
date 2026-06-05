---
title: Leetcode 701 - Insert into a bst
date: 2021-10-01 22:27:24
tags:
- binary tree
- bst
---
**`Note:`**
- Because it's a BST and all values are unique. 
- If `val > node.val`, it means we should check on the `right` subtree, otherwise `left` subtree. 
- If the next node is a `leaf` node, we can just append a new node to it. Otherwise, we do `recursion`.

You are given the root node of a binary search tree (BST) and a value to insert into the tree. Return the root node of the BST after the insertion. It is guaranteed that the new value does not exist in the original BST.

Notice that there may exist multiple valid ways for the insertion, as long as the tree remains a BST after insertion. You can return any of them.

**Example**

![img](https://assets.leetcode.com/uploads/2020/10/05/insertbst.jpg)
```
Input: root = [4,2,7,1,3], val = 5
Output: [4,2,7,1,3,5]
Explanation: Another accepted tree is:
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
 * @param {number} val
 * @return {TreeNode}
 */
var insertIntoBST = function(root, val) {
  if (!root) {
    const node = new TreeNode(val);
    return node;
  }
  insert(root);
  return root;
  
  function insert(node) {
    const newNode = new TreeNode(val);
    if (node.val > val) {
      if (node.left) {
        insert(node.left);
      } else {
        node.left = newNode;
      }
    } else if (node.val < val) {
      if (node.right) {
        insert(node.right);
      } else {
        node.right = newNode;
      }
    }
  }
};
```