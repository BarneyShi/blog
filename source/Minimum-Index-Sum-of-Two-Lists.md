---
title: Leetcode 599 - Minimum Index Sum of Two Lists
date: 2021-12-08 00:20:01
tags:
- hash table
---
**`Note:`**
- Use `map` to store `index` in list1.
- For list2, if `list2[i]` appears in `map`, then compare index sum.
- Be careful there might be multiple results in the array.

**`Question:`**

Suppose Andy and Doris want to choose a restaurant for dinner, and they both have a list of favorite restaurants represented by strings.

You need to help them find out their common interest with the least list index sum. If there is a choice tie between answers, output all of them with no order requirement. You could assume there always exists an answer.

**`Example:`**
```
Input: list1 = ["Shogun","Tapioca Express","Burger King","KFC"], list2 = ["Piatti","The Grill at Torrey Pines","Hungry Hunter Steakhouse","Shogun"]
Output: ["Shogun"]
Explanation: The only restaurant they both like is "Shogun".
```

**`Code:`**
```javascript
/**
 * @param {string[]} list1
 * @param {string[]} list2
 * @return {string[]}
 */
var findRestaurant = function(list1, list2) {
  let map = new Map();
  let res = Infinity;
  let restaurant = [];
  for (let i = 0; i < list1.length; i++) {
    map.set(list1[i], i);
  }
  for (let i = 0; i < list2.length; i++) {
    if (!map.has(list2[i])) continue;

    if (i + map.get(list2[i]) === res) {
      restaurant.push(list2[i]);
    } else if (i + map.get(list2[i]) < res) {
      res = i + map.get(list2[i]);
      restaurant = [list2[i]];
    }
  }
  return restaurant;
};
```