---
title: Leetcode 337 - House robber III
date: 2021-09-19 15:32:47
tags:
- leetcode
- dp
- binary tree
---
**`Note`**
- DFS
  - Normal recursion will TLE. We need a map `memo` to remember the max result for `node`.
- DP
  - When it comes to `tree`, when need `recursion` in DP.
  - We need an array to remember the states of `children`.
  - In this case, we need an array of length `2`. `res[0]` contains the value when we don't pick the current node, while `res[1]` contains the value when we pick the current node.

The thief has found himself a new place for his thievery again. There is only one entrance to this area, called root.

Besides the root, each house has one and only one parent house. After a tour, the smart thief realized that all houses in this place form a binary tree. It will automatically contact the police if two directly-linked houses were broken into on the same night.

Given the root of the binary tree, return the maximum amount of money the thief can rob without alerting the police.

**Example**

![img](https://assets.leetcode.com/uploads/2021/03/10/rob1-tree.jpg)
```
Input: root = [3,2,3,null,3,null,1]
Output: 7
Explanation: Maximum amount of money the thief can rob = 3 + 3 + 1 = 7.
```
![img](https://i.imgur.com/ClODwWq.png)
```
Input: root = [1000, 998, 1001, 0, 9999, null, null]
Ouput; 11000
Explanation: In this example, I want to show that it's not necessary to pick a whole level, even if we didn't pick the level's parent nodes.
```

**Iterative**
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
var rob = function(root) {
  if (!root) return 0;
  const map = new Map();
  return recursiveRob(root);

  function recursiveRob(node) {
    if (!node) return 0;
    if (map.has(node)) return map.get(node);
    // If pick the root
    let val1 = node.val;
    if (node.left) val1 += recursiveRob(node.left.left) + recursiveRob(node.left.right);
    if (node.right) val1 += recursiveRob(node.right.left) + recursiveRob(node.right.right);
    // If we don't pick the root
    let val2 = recursiveRob(node.left) + recursiveRob(node.right);
    const max = Math.max(val1, val2);
    map.set(node, max);
    return max;;
  }
};
```

**DP**
```javascript
var rob = function(root) {
  const result = recursion(root);
  return Math.max(result[0], result[1]);

  function recursion(node) {
    if (!node) return [0,0];
    let left = [0,0];
    let right = [0,0];
    left = recursion(node.left);
    right = recursion(node.right);
    return [node.val + left[1] + right[1], Math.max(left[0], left[1]) + Math.max(right[0], right[1])];
  }
};
```