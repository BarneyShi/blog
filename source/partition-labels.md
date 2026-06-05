---
title: Leetcode 763 - Partition labels
date: 2021-10-07 20:45:32
tags:
- greedy
---
**`Note:`**
- No matter which method, we have to use `Map` to get each char's `[firstIndex, lastIndex]`. So, we are actually dealing with question of `merging intervals`.
- Because the result would be a sorted array, we need to `sort by firstIndex`.
- If `cur's firstIndex > prev's lastIndex`, it means there is no overlap. Add cur as a new element.
- If `cur's firstIndex < prev's lastIndex`, it means there is overlap. Don't add `cur` and update `prev's lastIndex` to `Math.max(intervals[i][1], result[result.length - 1][1])`.

You are given a string `s`. We want to partition the string into as many parts as possible so that each letter appears in at most one part.

Return a list of integers representing the `size` of these parts.

**Example**
```
Input: s = "ababcbacadefegdehijhklij"
Output: [9,7,8]
Explanation:
The partition is "ababcbaca", "defegde", "hijhklij".
This is a partition so that each letter appears in at most one part.
A partition like "ababcbacadefegde", "hijhklij" is incorrect, because it splits s into less parts.
```

**`Brute force`**
```javascript
/**
 * @param {string} s
 * @return {number[]}
 */
var partitionLabels = function(s) {
  let map = new Map();
  for (let i = 0; i < s.length; i++) {
    if (!map.has[s[i]]) {
      map.set(s[i], [s.indexOf(s[i]), s.lastIndexOf(s[i])]);
    }
  }
  let intervals = [];
  map.forEach(e => intervals.push([...e]));
  let result = [[...intervals[0]]];
  for (let i = 1; i < intervals.length; i++) {
    let length = result.length;
    let noOverlap = true;
    for (let j = 0; j < length; j++) {
      if (intervals[i][0] > result[j][0] && intervals[i][0] < result[j][1] || intervals[i][1] > result[j][0] && intervals[i][1] < result[j][1]) {
        result[j][0] = Math.min(intervals[i][0], result[j][0]);
        result[j][1] = Math.max(intervals[i][1], result[j][1]);
        noOverlap = false;
        break;
      }
    }
    if (noOverlap) result.push([intervals[i][0], intervals[i][1]]);
  }
  return result.map(e => e[1] - e[0] + 1);
};
```

**`Greedy Optimal`**
```javascript
/**
 * @param {string} s
 * @return {number[]}
 */
var partitionLabels = function(s) {
  let map = new Map();
  for (let i = 0; i < s.length; i++) {
    if (!map.has[s[i]]) {
      map.set(s[i], [s.indexOf(s[i]), s.lastIndexOf(s[i])]);
    }
  }
  let intervals = [];
  map.forEach(e => intervals.push([...e]));
  intervals.sort((a, b) => a[0] - b[0]);
  let result = [[...intervals[0]]];
  for (let i = 1; i < intervals.length; i++) {
    if (intervals[i][0] > result[result.length - 1][1]) {
      result.push([...intervals[i]]);
      continue;
    };
    result[result.length - 1][1] = Math.max(intervals[i][1], result[result.length - 1][1]);
  }
  return result.map(e => e[1] - e[0] + 1);
};
```