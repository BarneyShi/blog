---
title: Leetcode 274 - H-index
date: 2021-12-02 16:41:01
tags:
---
**`Note:`**
- I lost 10 IQ while reading this description.
- Two edge cases to think about:
  - When `h === n`. So if `citations[i - 1] >= i`, we need to include that `citations[h] === undefined` condition.
  - When `h === 0`. Return 0 as a base case.

**`Question:`**

Given an array of integers citations where citations[i] is the number of citations a researcher received for their ith paper, return compute the researcher's h-index.

According to the definition of h-index on Wikipedia: A scientist has an index h if h of their n papers have at least h citations each, and the other n − h papers have no more than h citations each.

If there are several possible values for h, the maximum one is taken as the h-index.

**`Example:`**
```
Input: citations = [3,0,6,1,5]
Output: 3
Explanation: [3,0,6,1,5] means the researcher has 5 papers in total and each of them had received 3, 0, 6, 1, 5 citations respectively.
Since the researcher has 3 papers with at least 3 citations each and the remaining two with no more than 3 citations each, their h-index is 3.
```

**`Code:`**
```javascript
/**
 * @param {number[]} citations
 * @return {number}
 */
var hIndex = function(citations) {
  citations.sort((a, b) => b - a);
  for (let i = citations.length; i >= 0; i--) {
    if (i - 1 >= 0 && citations[i - 1] >= i && (citations[i] <= i || citations[i] === undefined)) return i;
  }
  return 0;
};
```