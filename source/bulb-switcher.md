---
title: Leetcode 319 - Bulb switcher
date: 2021-11-14 15:26:29
tags:
- math
---
**`Note:`**
- If a bulb wants to be turned on in the end, it has to been switched for `odd` times.
- For `Kth` bulb, if there is a `factor` between `[1, k]`, say `m`, we can be sure `k/m` is also in between `[1,k]`. 
- So if `k` has `odd` number of factors, it must be on in the end.
- To let `k` have `odd` number of factors, it must be a `Square number`.
- So the real question is `how many square numbers in [1,n]`?
- Based on some math deduction, it's `floor(sqrt(n))`.

**`Question:`**

There are `n` bulbs that are initially off. You first turn on all the bulbs, then you turn off every second bulb.

On the third round, you toggle every third bulb (turning on if it's off or turning off if it's on). For the `ith` round, you toggle every `i` bulb. For the `nth` round, you only toggle the last bulb.

Return the number of bulbs that are on after `n` rounds.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2020/11/05/bulb.jpg)
```
Input: n = 3
Output: 1
Explanation: At first, the three bulbs are [off, off, off].
After the first round, the three bulbs are [on, on, on].
After the second round, the three bulbs are [on, off, on].
After the third round, the three bulbs are [on, off, off]. 
So you should return 1 because there is only one bulb is on.
```

**`Code:`**
```javascript
/**
 * @param {number} n
 * @return {number}
 */
var bulbSwitch = function(n) {
  return ~~(Math.sqrt(n));
};
```