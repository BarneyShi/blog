---
title: Leetcode 373 - Find K pairs with smallest sums
date: 2021-12-09 02:42:36
tags:
- heap
- priority queue
---
**`Note:`**
- Use `maxPriorityQueue` coz it's easier to check if we need to add new pairs after `size >= k`.
- Add first `k` pairs. After that, if `new pairs < pq.top`, `pop` the top and add the new pair.
- We don't need to iterate all `nums1` and `nums2`. We only need to iterate `k` each coz then we'll have `k**2` in total. We can def find `k` pairs from them.

**`Question:`**

You are given two integer arrays `nums1` and `nums2` sorted in `ascending` order and an integer `k`.

Define a pair `(u, v)` which consists of one element from the first array and one element from the second array.

Return the `k` pairs `(u1, v1), (u2, v2), ..., (uk, vk)` with the smallest sums.

**`Example:`**
```
Input: nums1 = [1,7,11], nums2 = [2,4,6], k = 3
Output: [[1,2],[1,4],[1,6]]
Explanation: The first 3 pairs are returned from the sequence: [1,2],[1,4],[1,6],[7,2],[7,4],[11,2],[7,6],[11,4],[11,6]
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums1
 * @param {number[]} nums2
 * @param {number} k
 * @return {number[][]}
 */
var kSmallestPairs = function(nums1, nums2, k) {
  let pq = new MaxPriorityQueue({priority : obj => obj.sum});
  for (let i = 0; i < Math.min(nums1.length, k); i++) {
    for (let j = 0; j < Math.min(nums2.length, k); j++) {
      if (pq.size() >= k) {
        if (nums1[i] + nums2[j] < pq.front().element.sum) {
          pq.dequeue();
          pq.enqueue({pair : [nums1[i], nums2[j]], sum : nums1[i] + nums2[j]});
        }
      } else {
        pq.enqueue({pair : [nums1[i], nums2[j]], sum : nums1[i] + nums2[j]});
      }
    }
  }
  let res = [];
  for (let i = 0; i < k && pq.size() > 0; i++) {
    const obj = pq.dequeue().element.pair;
    res.unshift(obj);
  }
  return res;
};
```