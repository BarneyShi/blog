---
title: Leetcode 135 - Candy
date: 2021-10-06 20:09:56
tags:
- greedy
---
**`Note:`**
- How to be greedy? 
- From left to right, make `result[i] > result[i-1]` if `rating[i] > ratings[i-1]`. Then from right to left, make `result[i] > result[i+1]` if `ratings[i] > ratings[i+1]`

There are `n` children standing in a line. Each child is assigned a rating value given in the integer array `ratings`.

You are giving candies to these children subjected to the following requirements:

- Each child must have at least one candy.
- Children with a higher rating get more candies than their neighbors.
Return the minimum number of candies you need to have to distribute the candies to the children.

**Example**
```
Input: ratings = [1,0,2]
Output: 5
Explanation: You can allocate to the first, second and third child with 2, 1, 2 candies respectively.
```

```javascript
/**
 * @param {number[]} ratings
 * @return {number}
 */
var candy = function(ratings) {
  let result = [...Array(ratings.length).fill(1)];
  for (let i = 1; i < ratings.length; i++) {
    if (ratings[i] > ratings[i-1]) {
      result[i] = result[i-1] + 1;
    }
  }
  for (let i = ratings.length - 2; i >= 0; i--) {
    if (ratings[i] > ratings[i+1]) {
      result[i] = Math.max(result[i], result[i+1] + 1);
    }
  }
  return result.reduce((acc, cur) => acc + cur);
};
```