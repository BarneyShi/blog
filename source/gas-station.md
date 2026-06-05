---
title: Leetcode 134 - Gas station
date: 2021-10-06 17:25:35
tags:
- greedy
---
**`Note:`**
- `Greedy`
![img](https://i.imgur.com/ozFEDWp.png)
  - Conclusion: `curSum` is the sum of `[i, j]`. If it's less than `0`, it means that any start point between this interval traverse the whole array.
    - Prove: If there is an `k` between `[i,j]` from which you can traverse the whole array, because you can get to `k` from `i`, which means from `i` you can also traverse the whole array. It contracts our assumption. 
  - When `curSum` is negative, update `start` to `i+1`.
  - After the forloop ends, if `totalSum` is not positive, it means `sum(gas) < sum(cost)`, return -1. If `totalSum` is positive, and we finished iteration from an index `start`, it means we can traverse from `start` to the `end`, then the gas we left, can cover our trip from `end` to `start - 1` as `totalSum` is positive.

There are n gas stations along a circular route, where the amount of gas at the `ith` station is `gas[i]`.

You have a car with an unlimited gas tank and it costs `cost[i]` of gas to travel from the ith station to its next (i + 1)th station. You begin the journey with an empty tank at one of the gas stations.

Given two integer arrays gas and cost, return the starting gas station's index if you can travel around the circuit once in the clockwise direction, otherwise return -1. If there exists a solution, it is `guaranteed` to be `unique`

**Example**
```
Input: gas = [1,2,3,4,5], cost = [3,4,5,1,2]
Output: 3
Explanation:
Start at station 3 (index 3) and fill up with 4 unit of gas. Your tank = 0 + 4 = 4
Travel to station 4. Your tank = 4 - 1 + 5 = 8
Travel to station 0. Your tank = 8 - 2 + 1 = 7
Travel to station 1. Your tank = 7 - 3 + 2 = 6
Travel to station 2. Your tank = 6 - 4 + 3 = 5
Travel to station 3. The cost is 5. Your gas is just enough to travel back to station 3.
Therefore, return 3 as the starting index.
```

**`Brute force`**
```javascript
/**
 * @param {number[]} gas
 * @param {number[]} cost
 * @return {number}
 */
var canCompleteCircuit = function(gas, cost) {
  for (let i = 0; i < gas.length; i++) {
    let tank = 0;
    let curPos = i;
    while (tank >= 0) {
      tank += gas[curPos] - cost[curPos];
      if (tank < 0) {
        break;
      }
      curPos++;
      if (curPos === gas.length) {
        curPos = 0;
      }
      if (curPos === i) {
        return i;
      }
    }
  }
  return -1;
};
```

**`Greedy`**
```javascript
/**
 * @param {number[]} gas
 * @param {number[]} cost
 * @return {number}
 */
var canCompleteCircuit = function(gas, cost) {
  let start = 0;
  let curSum = 0;
  let totalSum = 0;
  for (let i = 0; i < gas.length; i++) {
    curSum += gas[i] - cost[i];
    totalSum += gas[i] - cost[i];
    if (curSum < 0) {
      curSum = 0;
      start = i + 1;
    }
  }
  if (totalSum < 0) return -1;
  return start;
};
```