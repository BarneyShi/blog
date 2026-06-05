---
title: Leetcode 264 - Ugly number II
date: 2021-12-05 02:32:25
tags:
- dp
- heap
- priority queue
---
**`Note:`**
- `DP`
  - Given a sequence of nums and find the next num. Is that a classic `DP` question?
  - But how do we know what the next num is?
  - All prev nums are got by `multiplying 2, 3 or 5`. Numbers that are got by `2` are like `1, 2, 4, 6, ...`.
  - Likewise, nums that are got by `3` are like `1, 3, 6, 9, ...`. So, if you multiply any of prev num with `2, 3, 5`, the num you get will be included in the `ugly[]`.
  - We need `3 Pointers` as `indexes` tracking which num `2, 3 or 5 should multiply with`. Start with dp[0].
  - Find the min among `dp[p2] * 2, dp[p3] * 3, dp[p5] * 5`.
  - By comparing `min` with `dp[p2] * 2, dp[p3] * 3, dp[p5] * 5`. If true, `p++`.

- `Min Heap`
  - In case of `duplicates`, use `Set()` to check duplicates.

**`Question:`**

An `ugly number` is a positive integer whose prime factors are limited to `2`, `3`, and `5`.

Given an integer `n`, return the `nth` ugly number.

**`Example:`**
```
Input: n = 10
Output: 12
Explanation: [1, 2, 3, 4, 5, 6, 8, 9, 10, 12] is the sequence of the first 10 ugly numbers.
```

**`Code:`**
```javascript
/**
 * @param {number} n
 * @return {number}
 */
 var nthUglyNumber = function(n) {
  let dp = [...Array(n).fill(0)];  
  dp[0] = 1;
  let p2 = 0;
  let p3 = 0;
  let p5 = 0;
  for (let i = 1; i < n; i++) {
    // It's dp[p], not just p * factor!
    let min = Math.min(dp[p2] * 2, dp[p3] * 3, dp[p5] * 5);
    // All if-else are paralleled.
    if (min === dp[p2] * 2) {
      p2++;
    }
    if (min === dp[p3] * 3) {
      p3++;
    }
    if (min === dp[p5] * 5) {
      p5++;
    }
    dp[i] = min;
  }
  return dp[n - 1];
};
```

**`MinHeap`**
```javascript
/**
 * @param {number} n
 * @return {number}
 */
 var nthUglyNumber = function(n) {
  const factors = [2, 3, 5];
  const minPQ = new MinPriorityQueue();
  minPQ.enqueue(1);
  let set = new Set([1]);
  let root = 0;
  for (let i = 0; i < n; i++) {
    root = minPQ.dequeue().element;
    for (const f of factors) {
      const next = f * root;
      // Check duplicates first.
      if (!set.has(next)) {
        minPQ.enqueue(f * root);
        set.add(next);
      }
    }
  }
  return root;
};
```