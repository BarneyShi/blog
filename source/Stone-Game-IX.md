---
title: Leetcode 2029 - Stone Game IX
date: 2022-01-19 15:17:38
tags:
- game theory
---
**`Note:`**
- The shorter the code is, the harder the problem is.
- First we need to realize that we `don't care about the value` of each stone, we just need to know their remainder against `s % 3`.
- There will be `0, 1, 2` three situations.
- Apparently, `0` will be used as a chance to shift choices. Both opponents will use `0` when they don't want to choose!.
- When `count0` is Even:
  - It doesn't have any impact on the outcome!
  - ![img](https://i.imgur.com/NIqiOPB.png)
  - Now, if either `count1` or `count2` is 0, then `Alice will def lose` on round 3. Such as `1, 1, 1` or `2, 2, 2`.
  - If Alice wants to win, just choose the smaller one between `count1` and `count2` BECAUSE if Alice choose the smaller one which is `1`, then in the following sequences, Bob will ALWAYS choose `1` and Alice will ALWAYS choose `2`, then because Bob will `exhaust his choices first`, and he has to choose Alice's 2, which leads to his loss.
- When `count1` is Odd:
  - It gives Alice another choice to choose again!
  - ![img](https://i.imgur.com/lO9MoT6.png)
  - Apparently, if Alice wants to win, the sequence will end like below
  - ![img](https://i.imgur.com/kIntUv2.png)
  - So as long as `|count1 - count2| > 2`, we can also form these kinds of sequences to make Bob exhaust his choice first, and has to resort to Alice's choices.
**`Question:`**

Alice and Bob continue their games with stones. There is a row of n stones, and each stone has an associated value. You are given an integer array `stones`, where `stones[i]` is the value of the `ith` stone.

Alice and Bob take turns, with Alice starting first. On each turn, the player may remove any stone from `stones`. The player who removes a stone loses if the `sum` of the values of `all removed stones` is divisible by 3. Bob will win automatically if there are no remaining stones (even if it is Alice's turn).

Assuming both players play `optimally`, return `true` if Alice wins and `false` if Bob wins.

**`Example:`**
```
Input: stones = [2,1]
Output: true
Explanation: The game will be played as follows:
- Turn 1: Alice can remove either stone.
- Turn 2: Bob removes the remaining stone. 
The sum of the removed stones is 1 + 2 = 3 and is divisible by 3. Therefore, Bob loses and Alice wins the game.
```

**`Code:`**
```javascript
/**
 * @param {number[]} stones
 * @return {boolean}
 */
var stoneGameIX = function(stones) {
  let remainder = 0;
  let zero = 0, one = 0, two = 0;
  for (const s of stones) {
    if (s % 3 === 0) {
      zero++;
    } else if (s % 3 === 1) {
      one++;
    } else {
      two++;
    }
  }
  if (zero % 2 === 0) {
    return one > 0 && two > 0;
  } else {
    return Math.abs(one - two) > 2;
  }
};
```