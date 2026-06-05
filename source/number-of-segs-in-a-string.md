---
title: Leetcode 434 - Number of segments in a string
date: 2021-10-07 02:38:52
tags:
- array
---
**`Note`**
- Know how to use reduce: You have to return something everytime!

You are given a string s, return the number of segments in the string. 

A `segment` is defined to be a contiguous sequence of `non-space characters`.

**Example**
```
Input: s = "Hello, my name is John"
Output: 5
Explanation: The five segments are ["Hello,", "my", "name", "is", "John"]

Input: s = ""
Output: 0
```

```javascript
/**
 * @param {string} s
 * @return {number}
 */
var countSegments = function(s) {
  let segs = s.split(' ');
  console.log(segs)
  return segs.reduce((acc, cur) => {
    if (cur !== '') {
      return acc += 1;
    }
    return acc;
  }, 0);
};
```