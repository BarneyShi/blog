---
title: Leetcode 129 - Sum root to leaf numbers
date: 2021-11-27 23:41:05
tags:
- dfs
- backtracking
---
**`Note:`**


**`Question:`**

You are given the `root` of a binary tree containing digits from `0` to `9` only.

Each root-to-leaf path in the tree represents a number.

- For example, the root-to-leaf path `1 -> 2 -> 3` represents the number `123`.

Return the total sum of all root-to-leaf numbers. Test cases are generated so that the answer will fit in a `32-bit` integer.

A `leaf` node is a node with no children.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2021/02/19/num1tree.jpg)
```
Input: root = [1,2,3]
Output: 25
Explanation:
The root-to-leaf path 1->2 represents the number 12.
The root-to-leaf path 1->3 represents the number 13.
Therefore, sum = 12 + 13 = 25.
```

**`Code:`**

**`Backtracking`**
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
var sumNumbers = function(root) {
  let res = [];
  let path = [];
  dfs(root);
  return res.reduce((acc, cur) => acc + cur, 0);

  function dfs(node){
    if (!node.left && !node.right) {
      path.push(node.val);
      res.push(path.join('') - 0);
      path.pop();
      return;
    }
    path.push(node.val);
    node.left && dfs(node.left)
    node.right && dfs(node.right);
    path.pop();
  }
};
```

**`DFS`**
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
var sumNumbers = function(root) {
  return dfs(root, 0);

  function dfs(node, sum) {
    if (!node) return 0;
    if (!node.left && !node.right) return 10 * sum + node.val;
    return dfs(node.left, 10 * sum + node.val) + dfs(node.right, 10 * sum + node.val);
  }
};
```