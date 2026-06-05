---
title: Leetcode 467 - Unique Substrings in Wraparound String
date: 2021-12-31 01:44:39
tags:
- double pointers
---
**`Note:`**
- First, for a substring with length `k`, how many substrs does it have?
  - It's `1 + 2 + 3 + ... + k`;
- The tricky part is how to avoid repetitve calculations. Like `p = abcab`, `abc` includes `ab`, so we should only count `abc` once.
- We should know that because `abc` is `longer` than `ab`, we should skip `ab`, which means for each char, we need to document the `longest substr starting with ch`!
- Mark the longest substr in `count[]` with length 26.
- Use `double pointers` to find the longest continuously increasing sequences starting with `p[left]`.
- Then we have a `len`. And by increasing `left`, we compare `count[left]` with `right - left + 1`.
- If `right - left + 1 > count[left]`, it means we should update count[ch].
- In the end, add up all char's length together from `count[]`.

**`Question:`**

We define the string `s` to be the infinite wraparound string of "`abcdefghijklmnopqrstuvwxyz`", so s will look like this:

- "...zabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcd....".

Given a string `p`, return the number of `unique non-empty substrings` of `p` are present in `s`.

**`Example:`**
```
Input: p = "a"
Output: 1
Explanation: Only the substring "a" of p is in s.
```

**`Code:`**
```javascript
/**
 * @param {string} p
 * @return {number}
 */
 var findSubstringInWraproundString = function(p) {
  let set = new Set();
  let left = 0, right = 0;
  let ans = 0;
  while (right < p.length) {
    if (set.has(p[right])) {
      right++;
      left++;
      continue;
    }
    while (right + 1 < p.length && !set.has(p[right]) && (p[right + 1].charCodeAt() === p[right].charCodeAt() + 1 || p[right + 1].charCodeAt() === p[right].charCodeAt() - 25)) {
      set.add(p[right]);
      right++;
    }
    if (right < p.length) set.add(p[right]);
    if (!set.has(p[left] + p[right])) {
      ans += countSubstrings(right - left + 1);
      set.add(p[left] + p[right]);
    }
    right++;
    left = right;
  }
  return ans;
  
  function countSubstrings(len) {
    return (1 + len) * len / 2;
  }
};
```