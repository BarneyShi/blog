---
title: Leetcode 124 - Binary tree maximum path sum
date: 2021-11-19 23:36:12
tags:
- dfs
---
**`Note:`**
- We def need to use `DFS`, but what should we return in each recursion?
- Consider these 3 situations:
  - ![img](https://i.imgur.com/mOXoILy.png)
  - ![img](https://i.imgur.com/pjUNEBk.png)
  - ![img](https://i.imgur.com/09PkfEr.png)
- For each node, we need to have 3 info to decide whether we should only `pick the node` or `extend to its subtrees`.
- Base case: return `[0, 0, 0]`.
- Normally, return `max = [nodeVal, nodeVal + maxLeftSubtreeSum, nodeVal + maxRightSubtreeSum]`;
- Don't really need `memo` because there is `no repetitive calculations`.
- Need to set a `res` variable, so we can compare with it for every node during recursions.
- `res = max(res, nodeVal, nodeVal + leftSum, nodeVal + rightSum, nodeVal + leftSum + rightSum)`.
- What I learned from this HARD DFS question?
  - Always know what you are gonna return in DFS.
  - Consider simple cases to build your DFS.
  - Don't care about details too much, and don't overthink!

**`Question:`**

A path in a binary tree is a sequence of nodes where each pair of adjacent nodes in the sequence has an edge connecting them. A node can only appear in the sequence at most once. Note that the path does not need to pass through the root.

The path sum of a path is the sum of the node's values in the path.

Given the root of a binary tree, return the maximum path sum of any non-empty path.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2020/10/13/exx2.jpg)
```
Input: root = [1,2,3]
Input: root = [-10,9,20,null,null,15,7]
Output: 42
Explanation: The optimal path is 15 -> 20 -> 7 with a path sum of 15 + 20 + 7 = 42.
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
var maxPathSum = function(root) {
  let memo = new Map();
  let res = -Infinity;
  dfs(root);
  return res;

  function dfs(node) {
    if (memo.has(node)) return memo.get(node);
    if (!node) return [0, 0, 0];
    const leftSum = dfs(node.left);
    const rightSum = dfs(node.right);
    const max = [node.val, node.val + Math.max(...leftSum), node.val + Math.max(...rightSum)];
    memo.set(node, [...max]);
    res = Math.max(res, max[1] + max[2] - node.val, max[0], max[1], max[2]);
    return memo.get(node);
  }
};
```