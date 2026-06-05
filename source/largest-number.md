---
title: Leetcode 179 - Largest number
date: 2021-11-14 04:37:06
tags:
---
**`Note:`**
- Sort each number based on the first `str` into their bucket.
- Then sort each bucket based on who shold be put at the head.
- Check if the result only consists of `0`s. Return `0`.

**`Question:`**

Given a list of non-negative integers `nums`, arrange them such that they form the largest number.

Note: The result may be very large, so you need to return a string instead of an integer.

**`Example:`**
```
Input: nums = [3,30,34,5,9]
Output: "9534330"
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 * @return {string}
 */
var largestNumber = function(nums) {
  nums = nums.map(e => e + '');
  let bucket = [...Array(10)].map(e => []);
  for (const num of nums) {
    const i = num[0];
    bucket[9 - (i - 0)].push(num);
  }
  
  bucket.forEach((e, i) => {
    const sorted = e.sort((a, b) => {
      const option1 = a + b;
      const option2 = b + a;
      if (option1 > option2) {
        return -1;
      }
      return 1;
    })
    bucket[i] = [];
    bucket[i].push(...sorted);
  })
  const res = [].concat(...bucket).join('');
  if (!res.match(/[^0]/, 'g')) return '0';
  return res;
};
```