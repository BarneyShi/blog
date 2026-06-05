---
title: Leetcode 481 - Magical String
date: 2022-01-03 19:06:09
tags:
---
**`Note:`**
- Use recursion to generate strings then count.
- Use `s` to contain the result, and `group[]` to contain every group.
- At first, there will be missing elements in `group[]`. Add them alternatively based on last element of `groups[]`, which means if the last is `1` we add `2`.
- But how many times should we repeat?
  - The patterns is `s[groups.length]`, which is the first num that `groups[]` is missing.

**`Question:`**

A magical string `s` consists of only `'1'` and `'2'` and obeys the following rules:

- The string s is magical because concatenating the number of contiguous occurrences of characters `'1'` and `'2'` generates the string `s` itself.

The first few elements of `s` is s = `"1221121221221121122……"`. If we group the consecutive 1's and 2's in s, it will be `"1 22 11 2 1 22 1 22 11 2 11 22 ......"` and the occurrences of 1's or 2's in each group are `"1 2 2 1 1 2 1 2 2 1 2 2 ......"`. You can see that the occurrence sequence is s itself.

Given an integer `n`, return the number of `1`'s in the first `n` number in the magical string s.

**`Example:`**
```
Input: n = 6
Output: 3
Explanation: The first 6 elements of magical string s is "122112" and it contains three 1's, so return 3.
```

**`Code:`**
```javascript
/**
 * @param {number} n
 * @return {number}
 */
 var magicalString = function(n) {
  if (n === 1) return '1';
  const str = dfs(['1'], '12');
  return str.match(/1/g).length;

  function dfs(groups, s) {
    if (s.length >= n) return s.slice(0, n);
    while (s.length > groups.length) {
      const nextNum = groups[groups.length - 1][0] === '1' ? '2' : '1';
      groups.push(nextNum.repeat(s[groups.length]));
    }
    return dfs(groups, groups.join(''));
  }
};
```