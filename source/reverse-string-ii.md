---
title: Leetcode 541 - Reverse string II
date: 2021-10-12 22:12:52
tags:
- double pointers
---
**`Note:`**
- Because we do this reverse thing every `2k`, we do `i = 2k + i` for each iteration.

**`Question:`**

Given a string s and an integer `k`, reverse the `first k` characters for every `2k` characters counting from the start of the string.

If there are fewer than k characters left, reverse all of them. If there are less than 2k but greater than or equal to k characters, then reverse the first k characters and left the other as original.

**`Example:`**
```
Input: s = "abcdefg", k = 2
Output: "bacdfeg"
```

**`Code:`**
```javascript
/**
 * @param {string} s
 * @param {number} k
 * @return {string}
 */
 var reverseStr = function(s, k) {
  const arr = s.split('');
  for (let i = 0; i < arr.length; i = 2*k + i) {
    let left = i;
    let right = i + k - 1;
    while (left < right) {
      [arr[left], arr[right]] = [arr[right], arr[left]];
      left++;
      right--;
    }
  }
  return arr.join('');
};

```