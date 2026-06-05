---
title: Leetcode 786 - K-th smallest prime fraction
date: 2021-11-28 16:11:45
tags:
- heap
- priority queue
---
**`Note:`**
- Use built-in `MinPriorityQueue` whose priority is based on `arr[i] / arr[j]`.
- We don't need to add all combinations of `arr[i] / arr[j]` at once.
- Add all `arr[0] / arr[j]` first, and `arr[0] / arr[N - 1]` has the highest priority.
- After dequeuing it, who's gonna be the next?
  - Either one of the left, or `arr[i + 1] / arr[j]`.
  - We are pretty sure that `arr[i + 1] / arr[j]` has a higher priority than those unadded because `arr[i + 1]` is the smallest number among unadded, plus `arr[j]` is the biggest number.
- Do this K times and we've found the answer.

**`Question:`**

You are given a `sorted` integer array arr containing `1` and `prime` numbers, where all the integers of arr are unique. You are also given an integer k.

For every `i` and `j` where `0 <= i < j < arr.length`, we consider the fraction `arr[i] / arr[j]`.

Return the `kth` smallest fraction considered. Return your answer as an array of integers of size 2, where `answer[0] == arr[i]` and `answer[1] == arr[j]`.

**`Example:`**
```
Input: arr = [1,2,3,5], k = 3
Output: [2,5]
Explanation: The fractions to be considered in sorted order are:
1/5, 1/3, 2/5, 1/2, 3/5, and 2/3.
The third fraction is 2/5.
```

**`Code:`**
```javascript
/**
 * @param {number[]} arr
 * @param {number} k
 * @return {number[]}
 */
var kthSmallestPrimeFraction = function(arr, k) {
  const N = arr.length;
  let heap = new MinPriorityQueue({priority : obj => obj.val});
  for (let i = 1; i < N; i++) {
    const val = arr[0] / arr[i];
    heap.enqueue({'x': 0, 'y':i, val});
  }
  let res;
  for (let i = 1; i <= k; i++) {
    let {x, y, val} = heap.dequeue().element;
    res = [arr[x], arr[y]];
    if (x + 1 < y) heap.enqueue({'x' : x + 1, y, 'val' : arr[x + 1] / arr[y]});
  }
  return res;
};
```