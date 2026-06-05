---
title: Leetcode 671 - Second Minimum Node In a Binary Tree
date: 2021-12-16 01:26:30
tags:
- dfs
---
**`Note:`**
- The root is the min val in the tree.
- Set up `secondMin = Infinity`.
- Traverse all nodes, and compare with `val < secondMin && val > Min`.

**`Question:`**

Given a non-empty special binary tree consisting of nodes with the non-negative value, where each node in this tree has exactly `two` or `zero` sub-node. If the node has two sub-nodes, then this node's value is the smaller value among its two sub-nodes. More formally, the property `root.val = min(root.left.val, root.right.val)` always holds.

Given such a binary tree, you need to output the `second minimum` value in the set made of all the nodes' value in the whole tree.

If no such second minimum value exists, output `-1` instead.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2020/10/15/smbt1.jpg)
```
Input: root = [2,2,5,null,null,5,7]
Output: 5
Explanation: The smallest value is 2, the second smallest value is 5.
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
 * @return {number}
 */
var findSecondMinimumValue = function(root) {
  const min = root.val;
  let secondMin = Infinity;
  dfs(root);
  return Infinity === secondMin ? -1 : secondMin;

  function dfs(node) {
    if (!node) return;
    if (node.val < secondMin && node.val > min) secondMin = node.val;
    dfs(node.left);
    dfs(node.right);
  }
};
```