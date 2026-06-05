---
title: Leetcode 455 - Minimum Genetic Mutation
date: 2021-12-20 18:42:10
tags:
- bfs
---
**`Note:`**
- To get the `min` operations, it's easier to use `BFS` instead of `DFS`.
- Use `visited[]` to store used genes in the `bank`.
- Use `queue` to do BFS.

**`Question:`**

A gene string can be represented by an 8-character long string, with choices from '`A`', '`C`', '`G`', and '`T`'.

Suppose we need to investigate a mutation from a gene string `start` to a gene string `end` where one mutation is defined as one single character changed in the gene string.

- For example, "`AACCGGTT`" --> "`AACCGGTA`" is one mutation.

There is also a gene `bank` bank that records all the valid gene mutations. A gene must be in `bank` to make it a valid gene string.

Given the two gene strings `start` and `end` and the gene bank bank, return the minimum number of mutations needed to mutate from start to end. If there is no such a mutation, return `-1`.

Note that the starting point is assumed to be valid, so it might not be included in the bank.

**`Example:`**
```
Input: start = "AACCGGTT", end = "AAACGGTA", bank = ["AACCGGTA","AACCGCTA","AAACGGTA"]
Output: 2
```

**`Code:`**
```javascript
/**
 * @param {string} start
 * @param {string} end
 * @param {string[]} bank
 * @return {number}
 */
var minMutation = function(start, end, bank) {
  let geneSet = new Set(bank);
  const choices = ['A', 'C', 'G', 'T'];
  let used = {};
  let level = 0;
  let queue = [start];
  while (queue.length > 0) {
    let length = queue.length;
    for (let i = 0; i < length; i++) {
      const curr = queue.shift();
      if (curr === end) return level;
      used[curr] = true;
      for (let j = 0; j < curr.length; j++) {
        for (let k = 0; k < 4; k++) {
          const next = curr.slice(0, j) + choices[k] + curr.slice(j + 1);
          if (used[next] !== undefined || !geneSet.has(next)) continue;
          queue.push(next);
        }
      }
    }
    level++;
  }
  return -1;
};
```