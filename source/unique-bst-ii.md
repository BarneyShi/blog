---
title: Leetcode 95 - Unique BST II
date: 2021-11-26 17:05:26
tags:
- bst
- binary tree
---
**`Note:`**
- Three question to ask yourself before writing a recursion function:
  1. What's the base case?
  2. What am I gonna return?
  3. WHat should I do with returned calls in each recursion?
- Base case: 
  - Because we use `low, right` to find node vals. The base should be there is no options left, so `low > right` and we return null.
- Return type?
  - Since the question requires an array, we should return an array.
- What to do with returned calls?
  - For a `root`, we found its `leftSubtrees` and `rightSubtrees`. We should combine them up with our `root` and push them into the return array.
  
**`Question:`**

Given an integer `n`, return all the structurally unique `BST`'s (binary search trees), which has exactly n nodes of unique values from `1` to `n`. Return the answer in any order.

**`Example:`**
```
Input: n = 3
Output: [[1,null,2,null,3],[1,null,3,2],[2,1,3],[3,1,null,null,2],[3,2,null,1]]
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
 * @param {number} n
 * @return {TreeNode[]}
 */
var generateTrees = function(n) {
  return geneBST(1, n);
  
  function geneBST(low, high) {
    if (low > high) return [null];
    if (low === high) return [new TreeNode(low)];
    let res = [];
    for (let i = low; i <= high; i++) {
      const left = geneBST(low, i - 1);
      const right = geneBST(i + 1, high);

      for (const leftTree of left) {
        for (const rightTree of right) {
          const root = new TreeNode(i);
          root.left = leftTree;
          root.right = rightTree;
          res.push(root);
        }
      }
    }
    return res;
  }
};
```