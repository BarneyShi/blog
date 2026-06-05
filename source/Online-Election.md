---
title: Leetcode 911 - Online Election
date: 2021-12-10 19:32:01
tags:
- binary search
---
**`Note:`**
- Give you a time, we need to find the `last timestamp` that is `less or equal` than `t`.
- It just sounds like `binary search` right?
- To accelerate this process, we need to precalculate an `tops[]` array in which each element represents the `winner` at `times[i]`.
- Detail: 
  - To prevent dead loop, `mid = left + right + 1 / 2)`. Without `plus 1`, we might fall into a dead loop like `[1, 3], t = 2` coz when `times[i] <= t`, we have `left = mid`. In this example, we'll be stuck at `left = 0` forever.

**`Question:`**

You are given two integer arrays `persons` and `times`. In an election, the `ith` vote was cast for `persons[i]` at time `times[i]`.

For each query at a time t, find the person that was leading the election at time t. Votes cast at time t will count towards our query. In the case of a tie, the most recent vote (among tied candidates) wins.

Implement the `TopVotedCandidate` class:

- `TopVotedCandidate(int[] persons, int[] times)` Initializes the object with the persons and times arrays.
- `int q(int t)` Returns the number of the person that was leading the election at time t according to the mentioned rules.

**`Example:`**
```
Input
["TopVotedCandidate", "q", "q", "q", "q", "q", "q"]
[[[0, 1, 1, 0, 0, 1, 0], [0, 5, 10, 15, 20, 25, 30]], [3], [12], [25], [15], [24], [8]]
Output
[null, 0, 1, 1, 0, 0, 1]

Explanation
TopVotedCandidate topVotedCandidate = new TopVotedCandidate([0, 1, 1, 0, 0, 1, 0], [0, 5, 10, 15, 20, 25, 30]);
topVotedCandidate.q(3); // return 0, At time 3, the votes are [0], and 0 is leading.
topVotedCandidate.q(12); // return 1, At time 12, the votes are [0,1,1], and 1 is leading.
topVotedCandidate.q(25); // return 1, At time 25, the votes are [0,1,1,0,0,1], and 1 is leading (as ties go to the most recent vote.)
topVotedCandidate.q(15); // return 0
topVotedCandidate.q(24); // return 0
topVotedCandidate.q(8); // return 1
```

**`Code:`**
```javascript
/**
 * @param {number[]} persons
 * @param {number[]} times
 */
var TopVotedCandidate = function(persons, times) {
  let map = new Map();
  let tops = [];
  let mostVotes = 0;
  let mostVoted;
  for (let i = 0; i < persons.length; i++) {
    if (!map.has(persons[i])) {
      map.set(persons[i], 1);
    } else {
      map.set(persons[i], map.get(persons[i]) + 1);
    }
    if (map.get(persons[i]) >= mostVotes) {
      mostVotes = map.get(persons[i]);
      tops[i] = persons[i];
      mostVoted = persons[i];
    } else {
      tops[i] = mostVoted;
    }
  }
  this.times = times;
  this.tops = tops;
};

/** 
 * @param {number} t
 * @return {number}
 */
TopVotedCandidate.prototype.q = function(t) {
  // Find the last index that is no bigger than t;
  let left = 0, right = this.tops.length - 1;
  while (left < right) {
    const mid = left + ((right - left + 1) >> 1);
    if (this.times[mid] <= t) {
      left = mid;
    } else {
      right = mid - 1;
    }
  }
  return this.tops[left];
};

/**
 * Your TopVotedCandidate object will be instantiated and called as such:
 * var obj = new TopVotedCandidate(persons, times)
 * var param_1 = obj.q(t)
 */
```