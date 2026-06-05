---
title: Leetcode 498 - Diagonal Traverse
date: 2022-01-04 20:36:55
tags:
---
**`Note:`**
- Imagine this matrix as a `binary tree`, then use level order traversal.

**`Question:`**

Given an `m x n` matrix mat, return an array of all the elements of the array in a `diagonal` order.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2021/04/10/diag1-grid.jpg)
```
Input: mat = [[1,2,3],[4,5,6],[7,8,9]]
Output: [1,2,4,7,5,3,6,8,9]
```

**`Code:`**
```javascript
/**
 * @param {number[][]} mat
 * @return {number[]}
 */
 var findDiagonalOrder = function (mat) {
  const rows = mat.length;
  const cols = mat[0].length;
  let ans = [];
  let isLeftToRight = true;
  let queue = [[0, 0]];
  let set = new Set();
  while (queue.length > 0) {
    let length = queue.length;
    set.clear();
    let tmp = [];
    for (let i = 0; i < length; i++) {
      const head = queue.shift();
      ans.push(mat[head[0]][head[1]]);
      let right = [head[0], head[1] + 1];
      let bottom = [head[0] + 1, head[1]];
      if (isLeftToRight) {
        if (bottom[0] < rows && !set.has(bottom[0] + '.' + bottom[1])) {
          tmp.push(bottom);
          set.add(bottom[0] + '.' + bottom[1]);
        }
        if (right[1] < cols && !set.has(right[0] + '.' + right[1])) {
          tmp.push(right);
          set.add(right[0] + '.' + right[1]);
        }
      } else {
        if (right[1] < cols && !set.has(right[0] + '.' + right[1])) {
          tmp.push(right);
          set.add(right[0] + '.' + right[1]);
        }
        if (bottom[0] < rows && !set.has(bottom[0] + '.' + bottom[1])) {
          tmp.push(bottom);
          set.add(bottom[0] + '.' + bottom[1]);
        }
      }
    }
    queue.push(...tmp.reverse());
    isLeftToRight = !isLeftToRight;
  }
  return ans;
};
```