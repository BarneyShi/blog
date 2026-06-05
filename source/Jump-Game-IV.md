---
title: Leetcode 1345 - Jump Game IV
date: 2022-01-20 15:41:33
tags:
- bfs
---
**`Note:`**
- Shortest path, apparently we need BFS.
- It's easier to write a classic BFS template, but it cannot pass cases like, `[7,7,7,7,7,7....,7,7]`.
- We did so many extra work with unnecessary 7.
- We need to skip `inbetween 7s`!
- For sequences with the same value, we only need the `start` and `end`!
- Skip over the middle ones because there is no way shorter from those inbetween ones to our end!
- We def would spend extra steps to get to the middle ones first.
- Also, `delete arr[i]` key from map after we have added all indexes with the same val to our queue.
- Note that to save speed, avoid using `shift()` on queue, instead reassign `queue` with a tmp array at the end.

**`Question:`**

Given an array of integers `arr`, you are initially positioned at the first index of the array.

In one step you can jump from index i to index:

- i + 1 where: i + 1 < arr.length.
- i - 1 where: i - 1 >= 0.
- j where: arr[i] == arr[j] and i != j.

Return the minimum number of steps to reach the `last index` of the array.

Notice that you can not jump outside of the array at any time.

**`Example:`**
```
Input: arr = [100,-23,-23,404,100,23,23,23,3,404]
Output: 3
Explanation: You need three jumps from index 0 --> 4 --> 3 --> 9. Note that index 9 is the last index of the array.
```

**`Code:`**
```javascript
/**
 * @param {number[]} arr
 * @return {number}
 */
 var minJumps = function(arr) {
  let queue = [0];
  let map = new Map();
  let used = new Set();
  let ans = 0;

  for (let i = 0; i < arr.length; i++) {
    if (arr[i] === arr[i - 1] && arr[i] === arr[i + 1]) continue;
    if (map.has(arr[i])) {
      map.get(arr[i]).push(i);
    } else {
      map.set(arr[i], [i]);
    }
  }

  used.add(0);
  while (queue.length > 0) {
    const length = queue.length;
    const next = new Array();
    for (let i = 0; i < length; i++) {
      const curr = queue[i];
      if (curr === arr.length - 1) return ans;
      if (map.has(arr[curr])) {
        for (const index of map.get(arr[curr])) {
          if (!used.has(index)) {
            used.add(index);
            next.push(index);
          }
        }
        map.delete(arr[curr]);
      }
      if (curr > 0 && !used.has(curr - 1)) {
        used.add(curr - 1);
        next.push(curr - 1);
      }
      if (curr + 1 < arr.length && !used.has(curr + 1)) {
        used.add(curr + 1);
        next.push(curr + 1);
      }
    }
    queue = next;
    ans++;
  }
  return ans;
};
```