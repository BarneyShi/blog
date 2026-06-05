---
title: Algorithm - KMP
date: 2021-10-13 17:58:31
tags:
- kmp
---
- What is prefix table? 
  - Table's length is the length of `pattern`. 
  - Each value is the `max` length of substring that can fit as `prefix` and `suffix`.
    - `Prefix` are substrings that don't include the last char.
    - `Suffix` are the substrings that don't include the first char.
    - For example `aaba`, `next[3] == 1` as in `a`.
- How to get the prefix table?
  - `i` can be understood as the `end of prefix`.
  - `j` can be understood as the `end of suffix`.
  - Let `i = 0`, `j = 1`. Take `aaa` for example, if `pattern[i] === pattern[j]`, then `next[j] === i + 1`.
  - if `pattern[i] !== pattern[j]` like below
  - ![img](https://i.imgur.com/pAfc8Em.png)
  - We need to find a max `prefix` for `suffix (ABABA)` ending at `j`! (The prefix will occupy all or part of ABABA)
  - We need to go back, but apparently we cannot do `i = next[i]` because then we'll always have a prefix ending with the same char like `pattern[j]`.
  - What about `next[i - 1]`? That sounds right!
  - By the definition of this prefix table, `pattern[0, i - 1]` is the same as a string ending before `j` whose length is the same as `pattern[0, i - 1]`. Right now they both end with `B`.
  - By `next[i - 1]`, we will find (if it exsits) a max prefix that ends with `B` (even if we have to iterate multiple times).
  - When we find this prefix, we get its `length` by `next[]`. And because of the table is indexed by `0`. When `pattern[j] === pattern[i]`, if means we are actually `checking the char after the prefix`. 
  - If they match, we've found a qualified prefix that's the longest and it is followed by a char that is the same as `pattern[j]`.
  - We got the prefix!

- The techqinue:
  - Deal with situations where chars are not equal `first`. 
  - Use `while` loops.
  - Try to remember it. A algo from 1977 is now a leetcode easy question, what a world.


```javascript
/**
 * @param {string} haystack
 * @param {string} needle
 * @return {number}
 */
var strStr = function(haystack, needle) {
  if (needle.length === 0) return 0;
  const next = geneNext(needle);
  let j = 0;
  for (let i = 0; i < haystack.length; i++) {
    while (j > 0 && haystack[i] !== needle[j]) {
      j = next[j - 1];
    }
    if (haystack[i] === needle[j]) j++;
    if (j === needle.length) return i - needle.length + 1;
  }
  return -1;
};

function geneNext(str) {
  const next = [...Array(str.length).fill(0)];
  let i = 0;
  for (let j = 1; j < str.length; j++) {
    while (i > 0 && str[i] !== str[j]) {
      // We let i be next[i-1] instead of i = next[indexOf(str[j])]
      i = next[i - 1];
    }
    if (str[i] === str[j]) {
      // Why we need plus one? Because the value of next[] is `length` but not `index`. Imagine we go all the way back to index 0 and `str[0] === str[j]`, then str[j] should be `1`.
      i++;
    }
    next[j] = i;
  }
  return next;
}
```
