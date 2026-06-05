---
title: Leetcode 171 - Excel sheet column number
date: 2021-08-18 23:13:42
tags:
- leetcode
- math
---
**Note**: Just like decimal system, we add `1` to the next digit. 

For example:

```
A -> 1
B -> 2
C -> 3
...
Z -> 26
AA -> 27
AB -> 28 
... 
```

**Example 1:**

```
Input: columnTitle = "A"
Output: 1
```

```javascript
var titleToNumber = function(columnTitle) {
  const arr = columnTitle.split('').reverse();
  let ans = 0;
  arr.forEach((e,index) => {
    ans += letterToNum(e)*(26**index);
  })
  return ans;
};
function letterToNum(letter) {
  const map = ['A','B','C','D','E','F', 'G', 'H', 'I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
  return map.indexOf(letter) + 1;
};
```
