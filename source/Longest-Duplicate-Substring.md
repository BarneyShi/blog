---
title: Leetcode 1044 - Longest Duplicate Substring
date: 2021-12-23 16:42:03
tags:
- hash table
- sliding window
- binary search
- rabin-karp
---
**`Note:`**
- This is a really hard question.
- When a substr with length `L` is a repeated str of s, then $L_0 < L$ is also a substr of s. 
- Based on this attribute, we can use `binary search`.
- In binary search, we use `mid` as the length to do `sliding windows`, and if we find it's indeed a repeated substr, we update `left` so next `mid` will become longer. If not, we update `right` to shrink the size of sliding window.
- The key part is how to efficiently check if `a` is `b`'s repeated substr?
- If use normal method, it'd be `O(n*len)` which is not optimal. Let me introduce `rabin-karp` algorithm, a `rolling hash` method. 
- It looks like 
  - $Hash = c_1 * b^{len-1} + c_2 * b^{len-2} + c_3 * b^{len-3} + ... + c_{len} * b^{0}$.
  - `b` is a random base we chose. `c` is ASCII code.
- From this, we can get a unique `hash` for every substr. However, when `sliding window` reaches size `k` and we want to `eliminate` the first char, it'd be time consuming if we just recalculate the whole again.
- So, we need to precalculate the `max term = B^(len-1)` in this polynomial.
- In addition, overflow is not avoidable, so we need to do `MOD` with a big prime number.
- Last, single hash can lead to `key collision`, so we need `double hash`.

**`Question:`**

Given a string `s`, consider all duplicated substrings: (contiguous) substrings of s that occur 2 or more times. The occurrences may overlap.

Return any duplicated substring that has the longest possible length. If `s` does not have a duplicated substring, the answer is `""`.

**`Example:`**
```
Input: s = "banana"
Output: "ana"
```

**`Code:`**
```javascript
/**
 * @param {string} s
 * @return {string}
 */
 var longestDupSubstring = function(s) {
  const MOD = 1000000007;
  const B1 = 26; // constant
  const B2 = 31; // constant
  let ans = '';

  let left = 0, right = s.length - 1;
  while (left < right) {
    const mid = left + ((right - left + 1) >> 1);
    const checkedAns = check(mid);
    if (checkedAns.length > 0) {
      left = mid;
      ans = checkedAns;
    } else {
      right = mid - 1;
    }
  }
  return ans;

  function check(len) {
    let hashCode1 = 0;
    let hashCode2 = 0;
    let set1 = new Set();
    let set2 = new Set();
    let maxTerm1 = 1;
    let maxTerm2 = 1;
    for (let i = 0; i < s.length; i++) {
      if (i < len) {
        maxTerm1 = maxTerm1 * B1 % MOD;
        maxTerm2 = maxTerm2 * B2 % MOD;
        hashCode1 = (hashCode1*B1 + s[i].charCodeAt(0)) % MOD;
        hashCode2 = (hashCode2*B2 + s[i].charCodeAt(0)) % MOD;
      } else {
        hashCode1 = (hashCode1*B1 + s[i].charCodeAt(0) - s[i - len].charCodeAt(0)*maxTerm1) % MOD;
        if (hashCode1 < 0) hashCode1 += MOD;
        hashCode2 = (hashCode2*B2 + s[i].charCodeAt(0) - s[i - len].charCodeAt(0)*maxTerm2) % MOD;
        if (hashCode2 < 0) hashCode2 += MOD;
      }
      if (set1.has(hashCode1) && set2.has(hashCode2)) return s.slice(i - len + 1, i + 1);
      if (i >= len - 1) {
        set1.add(hashCode1);
        set2.add(hashCode2);
      }
    }
    return '';
  }
};
```