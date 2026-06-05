---
title: Sort - Bubble sort
date: 2021-11-09 17:39:38
tags:
- sort
---
- Use two `for loops`.
1. Starting with the `first element`, compare the `current` element with the `next` element of the array.

2. If the current element is `greater` than the next element of the array, `swap` them.

3. If the current element is less than the next element, continue the comparison.

4. Start again from Step 1.

```
Iteration 1: [6,4,2,5,7] → [4,6,2,5,7] → [4,2,6,5,7] → [4,2,5,6,7] → [4,2,5,6,7]

Iteration 2:[4,2,5,6,7] → [2,4,5,6,7] → [2,4,5,6,7] → [2,4,5,6,7] → [2,4,5,6,7]

Iteration 3: [2,4,5,6,7] → [2,4,5,6,7] → [2,4,5,6,7] → [2,4,5,6,7] → [2,4,5,6,7]
```

```javascript
/**
 * @param {number[]} nums
 * @return {array} nums
 */
var bubbleSort = function(nums) {
  for (let i = 0; i < nums.length; i++) {
    for (let j = 0; j < nums.length; j++) {
      if (j < nums.length - 1 && nums[j] > [nums[j + 1]]) {
        [nums[j], nums[j + 1]] = [nums[j + 1], nums[j]];
      }
    }
  }
  return nums;
};
```