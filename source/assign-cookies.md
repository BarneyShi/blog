---
title: Leetcode 455 - Assign cookies
date: 2021-10-04 03:42:17
tags:
- greedy
---
**`Note:`**
- Greedy - Use biggest `s` to feed biggest `g`.
- Sort g and s first.
- Iterate backwards, use two pointers `i` and `j` on both arrays, if `g[i] <= s[j]`, then `j--, i--`, otherwise only `i--`.
- Stop when either `i` or `j` is less than `0`.

Assume you are an awesome parent and want to give your children some cookies. But, you should give each child at most one cookie.

Each child i has a greed factor `g[i]`, which is the minimum size of a cookie that the child will be content with; and each cookie j has a size `s[j]`. If s[j] >= g[i], we can assign the cookie j to the child i, and the child i will be content. Your goal is to maximize the number of your content children and output the maximum number.

**Example**
```
Input: g = [1,2], s = [1,2,3]
Output: 2
Explanation: You have 2 children and 3 cookies. The greed factors of 2 children are 1, 2. 
You have 3 cookies and their sizes are big enough to gratify all of the children, 
You need to output 2.
```

```javascript
/**
 * @param {number[]} g
 * @param {number[]} s
 * @return {number}
 */
var findContentChildren = function(g, s) {
  g.sort((a,b) => a - b);
  s.sort((a,b) => a - b);
  let result = 0;
  let j = s.length - 1;
  for (let i = g.length - 1; i >= 0 && j >= 0; i--) {
    if (g[i] <= s[j]) {
      j--;
      result++;
    }
  }
  return result;
};
```