---
title: Leetcode 437 - Path Sum III
date: 2021-12-21 03:11:21
tags:
- dfs
---
**`Note:`**
- ![img](https://i.imgur.com/89Szp8o.png)
- Path sum on a tree, usually we need DFS.
- What should we return in each `DFS`?
- It should include `node.val`, and add `node.val` to `every combination from children`.
- Base case: Return [].
- What to do in each recursion?
  - If `node.val === target`, ans++;
  - Put `left` and `right` results together, and see how many `target - val` are in there.
- Return `[val, ...left.map(e => e + val), ...right.map(e => e + val)]`; 
- Basically, `preSum` of children nodes.

**`Question:`**

Given the `root` of a binary tree and an integer `targetSum`, return the number of paths where the sum of the values along the path equals `targetSum`.

The path does not need to start or end at the root or a leaf, but it must go downwards (i.e., traveling only from parent nodes to child nodes).

**`Example:`**

![img](https://assets.leetcode.com/uploads/2021/04/09/pathsum3-1-tree.jpg)
```
Input: root = [10,5,-3,3,2,null,11,3,-2,null,1], targetSum = 8
Output: 3
Explanation: The paths that sum to 8 are shown.
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
 * @param {number} targetSum
 * @return {number}
 */
var pathSum = function(root, targetSum) {
  let ans = 0;
  dfs(root);
  return ans;

  function dfs(node) {
    if (!node) return [];
    const left = dfs(node.left);
    const right = dfs(node.right);
    const leftAndRight = left.concat(right);
    const self = [node.val];
    if (node.val === targetSum) ans++;
    const matched = leftAndRight.filter(e => e === targetSum - node.val).length;
    ans += matched;
    return leftAndRight.map(e => e + node.val).concat(self);
  }
};
```