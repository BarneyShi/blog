---
title: Leetcode 506 - Relative ranks
date: 2021-11-24 17:55:16
tags:
- sort
---
**`Note:`**
- Store [score, index] into a map.
- Copy the input and sort the new array.
- Iterate the sorted array, and because all vals are unique, we can get the `original index`.
- Then do replacement.

**`Question:`**

You are given an integer array `score` of size `n`, where `score[i]` is the score of the `ith` athlete in a competition. All the scores are guaranteed to be `unique`.

The athletes are `placed` based on their scores, where the `1st` place athlete has the highest score, the `2nd` place athlete has the 2nd highest score, and so on. The placement of each athlete determines their rank:

- The `1st` place athlete's rank is "Gold Medal".
- The `2nd` place athlete's rank is "Silver Medal".
- The `3rd` place athlete's rank is "Bronze Medal".
- For the `4th` place to the `nth` place athlete, their rank is their placement number (i.e., the xth place athlete's rank is "x").

Return an `array` answer of size n where answer[i] is the `rank` of the ith athlete.

**`Example:`**
```
Input: score = [5,4,3,2,1]
Output: ["Gold Medal","Silver Medal","Bronze Medal","4","5"]
Explanation: The placements are [1st, 2nd, 3rd, 4th, 5th].
```

**`Code:`**
```javascript
/**
 * @param {number[]} score
 * @return {string[]}
 */
 var findRelativeRanks = function(score) {
  let map = new Map();
  for (let i = 0; i < score.length; i++) {
    map.set(score[i], i);
  }
  let sorted = [...score];
  sorted.sort((a, b) => b - a);
  for (let i = 0; i < sorted.length; i++) {
    const index = map.get(sorted[i]);
    if (i > 2) {
      score[index] = i + 1 + '';
    } else {
      if (i === 0) {
        score[index] = 'Gold Medal';
      } else if (i === 1) {
        score[index] = 'Silver Medal';
      } else {
        score[index] = 'Bronze Medal';
      }
    }
  }
  return score;
};

```