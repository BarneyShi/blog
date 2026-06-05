---
title: Leetcode 406 - Queue reconstructing by height
date: 2021-10-06 22:41:59
tags:
- greedy
---
**`Note:`**
- How to be greedy? 
  - `Local optima`: Meet the rules on every insertion.
  - `Global optima`: Every element meets the conditions.
- When it comes to `2D` array. Usually we need to sort by one dimension, then another.
- For `[i, j]`, because `j` depends on taller heights, we need to sort `people` first by `i` in `descending` order first.
- Create an empty array, iterate from left to right while inserting. Because the existing elements in our `result` already have bigger `i` (height), it means `j` is the `index` that we want to insert to.

You are given an array of people, people, which are the attributes of some people in a queue (not necessarily in order). Each `people[i] = [hi, ki]` represents the ith person of height hi with `exactly` ki other people in front who have a height greater than or equal to hi.

Reconstruct and return the queue that is represented by the input array people. The returned queue should be formatted as an array queue, where `queue[j] = [hj, kj]` is the attributes of the jth person in the queue (queue[0] is the person at the front of the queue).

**Example**
```
Input: people = [[7,0],[4,4],[7,1],[5,0],[6,1],[5,2]]
Output: [[5,0],[7,0],[5,2],[6,1],[4,4],[7,1]]
Explanation:
Person 0 has height 5 with no other people taller or the same height in front.
Person 1 has height 7 with no other people taller or the same height in front.
Person 2 has height 5 with two persons taller or the same height in front, which is person 0 and 1.
Person 3 has height 6 with one person taller or the same height in front, which is person 1.
Person 4 has height 4 with four people taller or the same height in front, which are people 0, 1, 2, and 3.
Person 5 has height 7 with one person taller or the same height in front, which is person 1.
Hence [[5,0],[7,0],[5,2],[6,1],[4,4],[7,1]] is the reconstructed queue.
```

```javascript
/**
 * @param {number[][]} people
 * @return {number[][]}
 */
var reconstructQueue = function(people) {
  people.sort((a, b) => {
    if (a[0] === b[0]) {
      return a[1] - b[1];
    }
    return b[0] - a[0];
  });
  let result = [];
  for (let i = 0; i < people.length; i++) {
    result.splice(people[i][1], 0, people[i]);
  }
  return result;
}; 
```