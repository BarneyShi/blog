---
title: Leetcode 378 - Kth smallest element in a sorted matrix
date: 2021-11-18 00:34:11
tags:
- binary search
---
**`Note:`**
- ![img](https://assets.leetcode-cn.com/solution-static/378/378_fig2.png)
- Why can we use `binary search` on this question? Especially, how do we know `mid = (low + right) / 2` is indeed in the matrix?
- Well, by resizing the window gradually, we are always sure that the result between `[low, high]`. 
- When the loop terminates, we are sure `low` (or high coz they are equal at that moment) is the answer.
- Detail:
  - In order not to traverse the whole matrix every time to count `val <= k`, count elements starting from the end of each col.

**`Question:`**

Given an `n x n matrix` where each of the rows and columns is sorted in ascending order, return the kth smallest element in the matrix.

Note that it is the `kth` smallest element in the sorted order, not the `kth` distinct element.

You must find a solution with complexity better than `O(n2)`.

**`Example:`**
```
Input: matrix = [[1,5,9],[10,11,13],[12,13,15]], k = 8
Output: 13
Explanation: The elements in the matrix are [1,5,9,10,11,12,13,13,15], and the 8th smallest number is 13
```

**`Code:`**
```javascript
/**
 * @param {number[][]} matrix
 * @param {number} k
 * @return {number}
 */
 var kthSmallest = function(matrix, k) {
  const rows = matrix.length;
  const cols = rows;
  let left = matrix[0][0], right = matrix[rows - 1][cols - 1];
  while (left < right) {
    const middle = left + ((right - left) >> 1);
    const count = countInMatrix(matrix, middle);
    if (count < k) {
      left = middle + 1;
    } else {
      right = middle;
    }
  }
  return left;

  function countInMatrix(matrix, target) {
    let count = 0;
    const length = matrix.length;
    let col = length - 1;
    let row = 0;
    while (row < length && col >= 0) {
      if (matrix[row][col] <= target) {
        count += col + 1;
        row++;
        // In next row, we are sure matrix[row][col] is no less than matrix[row - 1][col] and
        // matrix[row][col + 1] does not fit coz it's bigger than matrix[row - 1][col + 1].
      } else {
        col--;
      }
    }
    return count;
  }
};
```