---
title: Leetcode 1716 - Calculate Money in Leetcode Bank
date: 2022-01-14 16:34:18
tags:
- math
---
**`Note:`**
- Use math

**`Question:`**

Hercy wants to save money for his first car. He puts money in the Leetcode bank every day.

He starts by putting in $`1` on `Monday`, the first day. Every day from Tuesday to Sunday, he will put in `$1 more` than the day before. On every `subsequent Monday`, he will put in `$1 more than` the previous Monday.

Given n, return the `total amount` of money he will have in the Leetcode bank at the end of the nth day.

**`Example:`**
```
Input: n = 20
Output: 96
Explanation: After the 20th day, the total is (1 + 2 + 3 + 4 + 5 + 6 + 7) + (2 + 3 + 4 + 5 + 6 + 7 + 8) + (3 + 4 + 5 + 6 + 7 + 8) = 96.
```

**`Code:`**
```javascript
/**
 * @param {number} n
 * @return {number}
 */
var totalMoney = function(n) {
  const weeks = Math.floor(n / 7);
  const remainder = n % 7;
  return (1 + 7)*7/2*weeks + weeks*(weeks - 1)*7/2 + (weeks + 1 + weeks + 1 + remainder - 1)*remainder/2;
};
```