---
title: Leetcode 1688 - Count of Matches in Tournament
date: 2022-01-24 14:32:20
tags:
---
**`Note:`**
- Easy simulation.

**`Question:`**

You are given an integer `n`, the number of teams in a tournament that has strange rules:

- If the current number of teams is even, each team gets paired with another team. A total of `n / 2` matches are played, and `n / 2` teams advance to the next round.
- If the current number of teams is odd, one team randomly advances in the tournament, and the rest gets paired. A total of `(n - 1) / 2` matches are played, and `(n - 1) / 2 + 1` teams advance to the next round.

Return `the number of matches` played in the tournament until a winner is decided.

**`Example:`**
```
Input: n = 7
Output: 6
Explanation: Details of the tournament: 
- 1st Round: Teams = 7, Matches = 3, and 4 teams advance.
- 2nd Round: Teams = 4, Matches = 2, and 2 teams advance.
- 3rd Round: Teams = 2, Matches = 1, and 1 team is declared the winner.
Total number of matches = 3 + 2 + 1 = 6.
```

**`Code:`**
```javascript
/**
 * @param {number} n
 * @return {number}
 */
var numberOfMatches = function(n) {
  let ans = 0;
  while (n > 1) {
    if (n % 2 === 0) {
      ans += n / 2;
      n = n / 2;
    } else {
      ans += (n - 1) / 2;
      n = 1 + (n - 1) / 2;
    }
  }
  return ans;
};
```