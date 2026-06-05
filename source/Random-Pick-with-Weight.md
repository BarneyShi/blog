---
title: Leetcode 528 - Random Pick with Weight
date: 2022-01-07 20:17:11
tags:
- presum
---
**`Note:`**
- By the description, $P_{w[i]} = \frac{w[i]}{sum(w)}$.
- In order for this to work, we have to make a `presum[]`.
- Imagine each `w[i]` occupy an interval on x-axios, then if we generate a `random`, the `first element` in presum[] that is bigger than `random` is our ans.
- ![img](https://i.imgur.com/nMTpuUI.png)

**`Question:`**

You are given a `0-indexed` array of positive integers `w` where `w[i]` describes the weight of the `ith` index.

You need to implement the function `pickIndex()`, which randomly picks an index in the range `[0, w.length - 1]` (inclusive) and returns it. The `probability` of picking an index i is `w[i] / sum(w)`.

For example, if w = [1, 3], the probability of picking index 0 is 1 / (1 + 3) = 0.25 (i.e., 25%), and the probability of picking index 1 is 3 / (1 + 3) = 0.75 (i.e., 75%).

**`Example:`**
```
Input
["Solution","pickIndex"]
[[[1]],[]]
Output
[null,0]

Explanation
Solution solution = new Solution([1]);
solution.pickIndex(); // return 0. The only option is to return 0 since there is only one element in w.
```

**`Code:`**
```javascript
/**
 * @param {number[]} w
 */
var Solution = function(w) {
  let presum = [...new Array(w.length + 1).fill(0)];
  let sum = 0;
  for (let i = 1; i < presum.length; i++) {
    sum += w[i - 1];
    presum[i] = presum[i - 1] + w[i - 1];
  }
  this.sum = sum;
  this.presum = presum;
};

/**
 * @return {number}
 */
Solution.prototype.pickIndex = function() {
  const rand = Math.random() * this.sum;
  let left = 0, right = this.presum.length - 1;
  while (left < right) {
    const mid = Math.floor((left + right) / 2);
    if (this.presum[mid] < rand) {
      left = mid + 1;
    } else {
      right = mid;
    }
  }
  return left - 1;
};

/**
 * Your Solution object will be instantiated and called as such:
 * var obj = new Solution(w)
 * var param_1 = obj.pickIndex()
 */
```