---
title: Leetcode 229 - Majority element II
date: 2021-10-21 17:13:04
tags:
---
**`Note:`**
- `Moore Voting Algo`
  - Initialize two `num`s and two `count`s as `num1 = nums[0], count1 = 2, num2 = nums[0], count2 = 0`.
  - Start iterating. 
    - When either `num1` or `num2` is null. Set count to 1.
    - When there is no match, `subtract 1` from `BOTH counts`.
    - When there is a match, plus one on the count.
  - We still need to iterate again to check if the result left is more than [n/3].

**`Question:`**

Given an integer array of size n, find all elements that appear more than `⌊ n/3 ⌋` times.

**`Example:`**
```
Input: nums = [3,2,3]
Output: [3]
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 * @return {number[]}
 */
 var majorityElement = function (nums) {
  // const limit = ~~(nums.length / 3);
  // let result = [];
  // let map = new Map();
  // for (let i = 0; i < nums.length; i++) {
  //   if (!map.has(nums[i])) {
  //     map.set(nums[i], 1);
  //   } else {
  //     map.set(nums[i], map.get(nums[i]) + 1);
  //   }
  // }
  // for (const [key, val] of map) {
  //   if (val > limit) result.push(key);
  // }
  // return result;
  if (nums.length < 2) return nums;
  const limit = ~~(nums.length / 3);
  let num1 = nums[0], num2 = nums[0], count1 = 0, count2 = 0;
  for (let i = 0; i < nums.length; i++) {
    const cur = nums[i];
    if (cur === num1) {
      count1++;
      continue;
    }
    if (cur === num2) {
      count2++;
      continue;
    }
    if (count1 === 0) {
      num1 = cur;
      count1 = 1;
      continue;
    }
    if (count2 === 0) {
      num2 = cur;
      count2 = 1;
      continue;
    }
    if (cur !== num1 && cur !== num2) {
      count1--;
      count2--;
    }
  }
  let result = [];
  if (count1 && nums.reduce((acc, cur) => acc += cur === num1 ? 1 : 0, 0) > limit) result.push(num1);
  if (count2 && nums.reduce((acc, cur) => acc += cur === num2 ? 1 : 0, 0) > limit) result.push(num2);
  return result;
};
```

**`Use Map`**
```javascript
 var majorityElement = function (nums) {
  const limit = ~~(nums.length / 3);
  let result = [];
  let map = new Map();
  for (let i = 0; i < nums.length; i++) {
    if (!map.has(nums[i])) {
      map.set(nums[i], 1);
    } else {
      map.set(nums[i], map.get(nums[i]) + 1);
    }
  }
  for (const [key, val] of map) {
    if (val > limit) result.push(key);
  }
  return result;
};
```