---
title: Leetcode 127 - Word ladder
date: 2021-11-22 01:57:02
tags:
- bfs
---
**`Note:`**
- Looking for `shortest` path, use `BFS` instead of `DFS`.
- Convert `wordList` into a `Set` so we can quickly check if we've used a word before.

**`Question:`**

A `transformation sequence` from word `beginWord` to word `endWord` using a dictionary `wordList` is a sequence of words `beginWord -> s1 -> s2 -> ... -> sk` such that:

- Every adjacent pair of words differs by a single letter.
- Every `si` for `1 <= i <= k` is in `wordList`. Note that `beginWord` does not need to be in `wordList`.
- `sk == endWord`
Given two words, `beginWord` and `endWord`, and a dictionary `wordList`, return the number of words in the shortest transformation sequence from `beginWord` to `endWord`, or 0 if no such sequence exists.

**`Example:`**
```
Input: beginWord = "hit", endWord = "cog", wordList = ["hot","dot","dog","lot","log","cog"]
Output: 5
Explanation: One shortest transformation sequence is "hit" -> "hot" -> "dot" -> "dog" -> cog", which is 5 words long.
```

**`Code:`**
```javascript
/**
 * @param {string} beginWord
 * @param {string} endWord
 * @param {string[]} wordList
 * @return {number}
 */
 var ladderLength = function(beginWord, endWord, wordList) {
  if (!wordList.includes(endWord)) return 0;
  let set = new Set(wordList);
  const result = bfs(beginWord);
  return result;

  function bfs(currWord) {
    let queue = [currWord];
    let count = 1;
    while (queue.length > 0) {
      const len = queue.length;
      for (let i = 0; i < len; i++) {
        const head = queue.shift();
        if (head === endWord) return count;
        for (let j = 0; j < head.length; j++) {
          for (let k = 97; k <= 122; k++) {
            const match = head.slice(0, j) + String.fromCharCode(k) + head.slice(j + 1);
            if (set.has(match)) {
              queue.push(match);
              // IMPORTANT: Delete `match` from set immediately after adding it to the queue. 
              // Otherwise we might add the same word many times in one loop.
              set.delete(match);
            }
          }
        }
      }
      count++;
    }
    return 0;
  }
};
```