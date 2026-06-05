---
title: Leetcode 1518 - Water Bottles
date: 2021-12-16 17:04:18
tags:
- dfs
---
**`Note:`**
- Intuition: recursion
- In every state, we need to know `fullBottles` and `emptyBottles`. Include `drinks` as result as a param.
- Base case: `fullB === 0`, return `drinks`.
- Next state: 
  - Add all `fullB` to `drinks`.
  - `emptyB = fullB + emptyB % exchange`.
  - next `fullBottles` is what you've exchange with all bottles. `floor(full + empty) / exchange`

**`Question:`**

Given `numBottles full` water bottles, you can exchange `numExchange` empty water bottles for one full water bottle.

The operation of drinking a full water bottle turns it into an empty bottle.

Return the `maximum` number of water bottles you can drink.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2020/07/01/sample_1_1875.png)
```
Input: numBottles = 9, numExchange = 3
Output: 13
Explanation: You can exchange 3 empty bottles to get 1 full water bottle.
Number of water bottles you can drink: 9 + 3 + 1 = 13.
```

**`Code:`**
```javascript
/**
 * @param {number} numBottles
 * @param {number} numExchange
 * @return {number}
 */
var numWaterBottles = function(numBottles, numExchange) {
  return dfs(numBottles, 0, 0);

  function dfs(fullBottles, emptyBottles, drinks) {
    if (fullBottles === 0) return drinks;
    return dfs(Math.floor((fullBottles + emptyBottles) / numExchange), (emptyBottles + fullBottles) % numExchange, drinks + fullBottles);
  }
};
```