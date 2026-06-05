---
title: Leetcode 275 - H-index II
date: 2021-12-02 17:25:03
tags:
- binary search
---
**`Note:`**
- Use binary search to reach log runtime.
- When `citations[mid] >= n - mid`, mid might be the answer, but our `h` can be evern bigger, so we should move left with `right = mid` (Not right = mid - 1 in case we miss our ans.)
- When `citations[mid] < n - mid`, either `citation[mid]` is too small or `mid` is too small, so we should `move right` by `left = mid + 1`.
- When the loop stops, the exception is array like `[0]`, we need to check if `cs[left] >= n - left`.
If not, return `0`.

**`Question:`**

Given an array of integers `citations` where `citations[i]` is the number of citations a researcher received for their ith paper and `citations` is sorted in an ascending order, return compute the researcher's h-index.

According to the definition of h-index on Wikipedia: A scientist has an index `h` if `h` of their `n` papers have `at least h citations` each, and the other `n − h` papers have no more than h citations each.

If there are several possible values for h, the maximum one is taken as the h-index.

You must write an algorithm that runs in `logarithmic` time.

**`Example:`**
```
Input: citations = [0,1,3,5,6]
Output: 3
Explanation: [0,1,3,5,6] means the researcher has 5 papers in total and each of them had received 0, 1, 3, 5, 6 citations respectively.
Since the researcher has 3 papers with at least 3 citations each and the remaining two with no more than 3 citations each, their h-index is 3.
```

**`Code:`**
```javascript
/**
 * @param {number[]} citations
 * @return {number}
 */
var hIndex = function(citations) {
  let left = 0, right = citations.length - 1;
  const n = citations.length;
  while (left < right) {
    const mid = ~~((left + right) / 2);
    if (citations[mid] >= n - mid) {
      right = mid;
    } else {
      left = mid + 1;
    }
  }
  return citations[left] >= n - left ? n - left : 0;
}; 
```