---
title: Leetcode 997 - Find the Town Judge
date: 2021-12-18 14:41:11
tags:
---
**`Note:`**
- Create array with length n to denote `trust` and `trusted` times.
- For each `[a, b]`, arr[a - 1]--, arr[b - 1]++; (Minus 1 because of 0-index)
- If there is a person that `arr[i] === n - 1`, then return it.
- Otherwise return -1;

**`Question:`**

In a town, there are `n` people labeled from `1` to `n`. There is a rumor that one of these people is secretly the town judge.

If the town judge exists, then:

- The town judge trusts nobody.
- Everybody (except for the town judge) trusts the town judge.
- There is exactly one person that satisfies properties 1 and 2.

You are given an array `trust` where `trust[i] = [ai, bi]` representing that the person labeled `ai` trusts the person labeled `bi`.

Return the label of the town judge if the town judge exists and can be identified, or return `-1` otherwise.

**`Example:`**
```
Input: n = 3, trust = [[1,3],[2,3]]
Output: 3
```

**`Code:`**
```javascript
/**
 * @param {number} n
 * @param {number[][]} trust
 * @return {number}
 */
var findJudge = function(n, trust) {
  let trustCount = [...new Array(n).fill(0)];
  for (const [a, b] of trust) {
    trustCount[a - 1]--;
    trustCount[b - 1]++;
  }
  for (const [i, t] of trustCount.entries()) {
    if (t === n - 1) return i + 1;
  }
  return -1;
};
```