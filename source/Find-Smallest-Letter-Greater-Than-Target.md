---
title: Leetcode 744 - Find Smallest Letter Greater Than Target
date: 2021-12-26 20:13:28
tags:
- binary search
---
**`Note:`**
- Classic binary search to find the `first` element that is bigger than or equal to target. 
- Note that we don't need to add 1 to `mid`.

**`Question:`**

Given a characters array `letters` that is sorted in non-decreasing order and a character `target`, return the smallest character in the array that is larger than target.

Note that the letters wrap around.

- For example, if `target == 'z' and `letters == ['a', 'b']`, the answer is 'a'.

**`Example:`**
```
Input: letters = ["c","f","j"], target = "a"
Output: "c"
```

**`Code:`**
```javascript
/**
 * @param {character[]} letters
 * @param {character} target
 * @return {character}
 */
var nextGreatestLetter = function(letters, target) {
  let left = 0, right = letters.length - 1;
  while (left < right) {
    const mid = left + ((right - left) >> 1);
    if (letters[mid] <= target) {
      left = mid + 1;
    } else {
      right = mid;
    }
  }
  if (letters[left] <= target) return letters[0];
  return letters[left];
};
```