---
title: Leetcode 508 - Most Frequent Subtree Sum
date: 2022-01-05 16:26:34
tags:
---
**`Note:`**
- Classic recursion.
- Use `map` to record occurences.

**`Question:`**

Given the `root` of a binary tree, return the most frequent `subtree sum`. If there is a tie, return all the values with the highest frequency in any order.

The `subtree sum` of a node is defined as the sum of all the node values formed by the subtree rooted at that node (including the node itself).

**`Example:`**

![img](https://assets.leetcode.com/uploads/2021/04/24/freq1-tree.jpg)
```
Input: root = [5,2,-3]
Output: [2,-3,4]
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
 * @return {number[]}
 */
var findFrequentTreeSum = function(root) {
  let map = new Map();
  dfs(root);
  let arr = [...map].sort((a, b) => b[1] - a[1]);
  arr = arr.filter(e => e[1] === arr[0][1]).map(e => e[0]);
  return arr;

  function dfs(node) {
    if (!node) return 0;
    const left = dfs(node.left);
    const right = dfs(node.right);
    if (!map.has(left + right + node.val)) {
      map.set(left + right + node.val, 1);
    } else {
      map.set(left + right + node.val, map.get(left + right + node.val) + 1);
    }
    return node.val + right + left;
  }
};
```