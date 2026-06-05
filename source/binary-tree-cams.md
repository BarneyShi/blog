---
title: Leetcode 968 - Binary tree cams
date: 2021-10-09 01:22:27
tags:
- dp
---
**`Note:`**
- `DP`
  - `dp[0]` node has a cam. `dp[1]` children have cams. `dp[2]` parent has cams.
  - Assume both left and right subtree exist. 
    - `dp[0]`: It doesn't matter children have cams or not. So we need to pick min cams from them. 
    - `dp[1]`: Consider `left` & `right` separately. Assume `left` has a cam, then pick min from `right[1]` or `right[0]`.
    - `dp[2]`: When cur node's parent has a cam. For left or right subtree, two situations for each: A cam for themself or covered by children.

**`Question:`**
You are given the root of a binary tree. We install cameras on the tree nodes where each camera at a node can monitor its parent, itself, and its immediate children.

Return the minimum number of cameras needed to monitor all nodes of the tree.

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
var minCameraCover = function(root) {
  return Math.min(recursion(root)[0], recursion(root)[1]);

  function recursion(node) {
    // 0 It has a camera, 1, his children have cams, 2 its father has cams.
    if (!node.left && !node.right) {
      return [1, 1, 0];
    }
    if (!node.right) {
      const left = recursion(node.left);
      return [1 + Math.min(left[2], left[1], left[0]), left[0], Math.min(left[1], left[0])];
    }
    if (!node.left) {
      const right = recursion(node.right);
      return [1 + Math.min(right[2], right[1], right[0]), right[0], Math.min(right[1], right[0])];
    }
    const left = recursion(node.left);
    const right = recursion(node.right);
    const l0 = Math.min(left[2], left[1], left[0]);
    const l1 = left[0] + Math.min(right[0], right[1]);
    const l2 = Math.min(left[1], left[0]);

    const r0 = Math.min(right[2], right[1], right[0]);
    const r1 = right[0] + Math.min(left[0], left[1]);
    const r2 = Math.min(right[1], right[0]);

    return [1 + l0 + r0, Math.min(l1, r1), l2 + r2];
  }
};
```