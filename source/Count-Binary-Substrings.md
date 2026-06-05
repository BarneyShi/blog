---
title: Leetcode 696 - Count Binary Substrings
date: 2021-12-21 20:54:12
tags:
---
**`Note:`**
- Is this really an easy problem?
- Imagine all consecutive `0` and `1` will form an array like `2,1,3,4,5...` in which each num is the count of `consecutive` 1 or 0.
- `Min(m, n)` for every adjacent pair is how many `grouped 1 & 0` pairs we can derive from a pair.
- For example, `1100011` lead to `2,3,2`
  - `1100` gives us `1100`,and `10`, which is min(2,3) = 2;
  - `00011` give us `0011`, `01`, which is min(3,2) = 2;

**`Question:`**

Give a binary string `s`, return the number of non-empty substrings that have the same number of `0`'s and `1`'s, and all the 0's and all the 1's in these substrings are grouped consecutively.

Substrings that occur multiple times are counted the number of times they occur.

**`Example:`**
```
Input: s = "00110011"
Output: 6
Explanation: There are 6 substrings that have equal number of consecutive 1's and 0's: "0011", "01", "1100", "10", "0011", and "01".
Notice that some of these substrings repeat and are counted the number of times they occur.
Also, "00110011" is not a valid substring because all the 0's (and 1's) are not grouped together.
```

**`Code:`**
```javascript
/**
 * @param {string} s
 * @return {number}
 */
var countBinarySubstrings = function(s) {
  let zeroes = 0;
  let ones = 0;
  let ans = 0;
  for (let i = 0; i < s.length; i++) {
    const curr = s[i];
    const prev = s[i - 1];
    if (zeroes === 0 || ones === 0 || curr === prev) {
      curr === '0' ? zeroes++ : ones++;
    } else {
      ans += Math.min(zeroes, ones);
      curr === '0' ? zeroes = 1 : ones = 1;
    }
  }
  ans += Math.min(zeroes, ones); 
  return ans ;
};
```