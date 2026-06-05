---
title: Leetcode 475 - Heaters
date: 2021-12-19 18:16:12
tags:
- sort
- binary search
- double pointers
---
**`Note:`**
- This is an interesting question. At first I tried to use `heater` to find covered houses. But in this way, `radius` must start from 0 and ofc it TLE.
- Suddenly I thought why not start from `house` to look for `heater`?
- As long as we can find the `nearest heater` for each house, and return `max` of those radius. Then we can be sure that all houses would be covered! 
- But we can just be too naive to iterate all heaters for each `house`. Use `bianry search` to accelerate the process!
- The special detail of this binary search is that we stop when either we've found `heater === house` or there are only `two heaters` left (The house is between them).
- So the terminating condition should be `left + 1 < right`.
- And to preserve the results, we have to update `left, right` as `left = mid` and `right = mid`. (Do not add 1.)
- For example, `heaters = 1,3,9,11,21`, `house = 6`, the result should be `[3, 9]`.
  - When `mid = 2`, to preserve `9`, we need to let `right = 2`.
  - Similarly if `house = 10`, the result should be `[9, 11]`. When `mid = 2`, to preserve `9`, we need to let `left = mid`.

**`Question:`**

Winter is coming! During the contest, your first job is to design a standard heater with a fixed warm radius to warm all the houses.

Every house can be warmed, as long as the house is within the heater's warm radius range. 

Given the positions of `houses` and `heaters` on a horizontal line, return the minimum radius standard of heaters so that those heaters could cover all houses.

Notice that all the `heaters` follow your radius standard, and the warm radius will the same.

**`Example:`**
```
Input: houses = [1,2,3,4], heaters = [1,4]
Output: 1
Explanation: The two heater was placed in the position 1 and 4. We need to use radius 1 standard, then all the houses can be warmed.
```

**`Code:`**
```javascript
/**
 * @param {number[]} houses
 * @param {number[]} heaters
 * @return {number}
 */
 var findRadius = function(houses, heaters) {
  let radiuses = [];
  heaters.sort((a, b) => a - b);
  for (let i = 0; i < houses.length; i++) {
    let left = 0, right = heaters.length - 1;
    let nearestHeater = null;
    while (left + 1 < right) {
      const mid = (left + right) >> 1;
      if (heaters[mid] === houses[i]) {
        nearestHeater = heaters[mid];
        break;
      } else if (heaters[mid] > houses[i]) {
        right = mid;
      } else {
        left = mid;
      }
    }
    if (!nearestHeater) {
      if (houses[i] - heaters[left] < heaters[right] - houses[i]) {
        nearestHeater = heaters[left];
      } else {
        nearestHeater = heaters[right];
      }
    }
    radiuses.push(Math.abs(nearestHeater - houses[i]));
  }
  return Math.max(...radiuses);
};
```