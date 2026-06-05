---
title: Leetcode 825 - Friends Of Appropriate Ages
date: 2021-12-26 18:53:06
tags:
- double pointers
- hash table
---
**`Note:`**
- Double pointer: Based on `0.5x + 7 < y <= x`, use two pointers to find the interval.
  - Note that from `x > 0.5x + 7` we get `x > 14`.
  - Don't reset left and right inside loop. Because we can restart from last positions.
- Brute force: Put every age into a map. 
  - From j = `0.5x + 8` to `x`, if map.has(j), requests we can make is len - 1 (exclude itself).

**`Question:`**

There are n persons on a social media website. You are given an integer array `ages` where `ages[i]` is the age of the $i^{th}$ person.

A Person `x` will not send a friend request to a person `y` `(x != y)` if any of the following conditions is true:

- age[y] <= 0.5 * age[x] + 7
- age[y] > age[x]
- age[y] > 100 && age[x] < 100
  
Otherwise, `x` will send a friend request to `y`.

Note that if `x` sends a request to `y`, `y` will not necessarily send a request to `x`. Also, a person will not send a friend request to themself.

Return the total number of friend requests made.

**`Example:`**
```
Input: ages = [16,16]
Output: 2
Explanation: 2 people friend request each other.
```

**`Code:`**

**Double Pointer O(nlogn)**
```javascript
/**
 * @param {number[]} ages
 * @return {number}
 */
 var numFriendRequests = function(ages) {
  let ans = 0;
  ages.sort((a, b) => a - b);
  // Don't put it inside loop coz it would repeat what we've done.
  let left = 0, right = 0; 
  for (let i = 0; i < ages.length; i++) {
    if (ages[i] <= 14) continue;
    while (ages[left] <= 0.5 * ages[i] + 7) left++;
    while (right + 1 < ages.length && ages[right + 1] <= ages[i]) right++;
    // Don't add 1 because ages[i] cannot befriend itself.
    ans += right - left;
  }
  return ans;
};
```

**Hash Table Brute Force**
```javascript
/**
 * @param {number[]} ages
 * @return {number}
 */
 var numFriendRequests = function(ages) {
  let map = new Map();
  for (let i = 0; i < ages.length; i++) {
    if (!map.has(ages[i])) {
      map.set(ages[i], [i]);
    } else {
      map.set(ages[i], [...map.get(ages[i]), i]);
    }
  }
  let ans = 0;
  for (let i = 0; i < ages.length; i++) {
    const x = ages[i];
    for (let j = Math.floor(0.5 * x) + 8; j <= x; j++) {
      if (map.has(j)) {
        ans += map.get(j).length;
        if (x === j) ans--;
      }
    }
  }
  return ans;
};
```