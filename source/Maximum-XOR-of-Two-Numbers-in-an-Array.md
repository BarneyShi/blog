---
title: Leetcode 421 - Maximum XOR of Two Numbers in an Array
date: 2021-12-18 18:58:42
tags:
- greedy
- bitwise
---
**`Note:`**
- Background knowledge: `a ^ b = c`, `c ^ a = b`.
- How to be `greedy`? Start from the most significant bit, set it to 1 as the `mask`. Do `mask & num` and add them all to a `map`.
- How to get the mask? 
  - Find `max` then flip all 0s to 1s, and calculate the length of it.
- If `map.has(n & mask ^ mask)`, it means there is another num that can do `a ^ b = mask`.
- If not, it means the digit should be `0` in mask.
- Continue it until mask's length === max.length.
- Visulize the process: As the process going, less and less nums would be left on both sides.
- ![img](https://i.imgur.com/j4ADwvZ.png)

**`Question:`**

Given an integer array `nums`, return the maximum result of `nums[i] XOR nums[j]`, where `0 <= i <= j < n`.

**`Example:`**
```
Input: nums = [3,10,5,25,2,8]
Output: 28
Explanation: The maximum result is 5 XOR 25 = 28.
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 * @return {number}
 */
 var findMaximumXOR = function(nums) {
  const max = Math.max(...nums);
  const mostSignificantBit = max.toString(2).length;
  let mask = 0;
  let map = new Map();
  for (let i = mostSignificantBit - 1; i >= 0; i--) {
    mask |= 1 << i;
    map.clear();
    let flag = false;
    for (const n of nums) {
      map.set(n & mask, true);
      if (map.has((n & mask) ^ mask)) {
        flag = true;
        break;
      }
    }
    if (!flag) mask ^= 1 << i;
  }
  return mask;
};
```