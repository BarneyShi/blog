---
title: Leetcode 331 - Verify preorder serialization of a binary tree
date: 2021-12-06 00:59:29
tags:
- binary tree
---
**`Note:`**
- `DFS`
  - Why would it work? If we can finish iterating the `preorder` array, it means it's a good binary tree.
  - What if there are some extra `nodes` at the end? Then `res !== preorder.length`.
  - What if there are some `nodes` missing? Because we check `i >= preorder.length`, we can still get `false`.
  - ![img](https://i.imgur.com/bFLvUxz.png)
- `Indegree & Outdegree`.
  - For a binary tree, `indegree === outdegree`
  - `Root` node provides `2 outdegree`.
  - `#` node provides `1 indegree`.
  - Normal node provides `1 indegree` and `2 outdegree`.

**`Question:`**

One way to serialize a binary tree is to use `preorder traversal`. When we encounter a non-null node, we record the node's value. If it is a null node, we record using a sentinel value such as `'#'`.

![img](https://assets.leetcode.com/uploads/2021/03/12/pre-tree.jpg)

For example, the above binary tree can be serialized to the string `"9,3,4,#,#,1,#,#,2,#,6,#,#"`, where `'#'` represents a null node.

Given a string of comma-separated values `preorder`, return `true` if it is a correct preorder traversal serialization of a binary tree.

It is `guaranteed` that each comma-separated value in the string must be either an integer or a character `'#'` representing null pointer.

You may assume that the input format is always valid.

- For example, it could never contain two consecutive commas, such as `"1,,3"`.

Note: You are not allowed to reconstruct the tree.
**`Example:`**
```
Input: preorder = "9,3,4,#,#,1,#,#,2,#,6,#,#"
Output: true
```

**`Code:`**
```javascript
/**
 * @param {string} preorder
 * @return {boolean}
 */
var isValidSerialization = function(preorder) {
  preorder = preorder.split(',');
  let flag = false;
  const res = dfs(0, preorder);
  return !flag && res === preorder.length;

  function dfs(i, preorder) {
    if (flag || i >= preorder.length) {
      flag = true;
      return 0;
    }
    if (preorder[i] === '#') return 1;
    const left = dfs(i + 1, preorder); 
    const right = dfs(i + left + 1, preorder);
    return 1 + left + right;
  }
};
```

```javascript
/**
 * @param {string} preorder
 * @return {boolean}
 */
var isValidSerialization = function(preorder) {
  // Special case
  if (preorder === '#') return true;

  let indegree = 0, outdegree = 0;
  preorder = preorder.split(',');
  for (let i = 0; i < preorder.length; i++) {
    if (i === 0) {
      // In case `#,1,1`
      if (preorder[0] === '#') return false;
      outdegree += 2;
      continue;
    }
    if (preorder[i] === '#') {
      indegree += 1;
    } else {
      indegree += 1;
      outdegree += 2;
    }
    if (i < preorder.length - 1 && indegree >= outdegree) return false;
  }
  return indegree === outdegree;
};
```