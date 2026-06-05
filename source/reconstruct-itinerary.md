---
title: Leetcode 332 - Reconstruct itinerary
date: 2021-09-13 23:31:22
tags:
- dfs
- backtracking
---
**`Note:`**
- This is DFS but can be treated like backtracking (The hardest I've done so far)
- We need to sort `tickets` first, so `the first path` we found must be the res coz we are using `greedy` algo to iterate in `smallest lexical` order.
- We need a flag `found` because if we don't stop the `following forloop`, more paths will be added into `res`.
- Used `visited` to mark visited path on the `same branch`. 

You are given a list of airline tickets where tickets[i] = [fromi, toi] represent the departure and the arrival airports of one flight. Reconstruct the itinerary in order and return it.

All of the tickets belong to a man who departs from "JFK", thus, the itinerary must begin with "JFK". If there are multiple valid itineraries, you should return the itinerary that has the smallest lexical order when read as a single string.

For example, the itinerary ["JFK", "LGA"] has a smaller lexical order than ["JFK", "LGB"].
You may assume all tickets form at least one valid itinerary. You must use all the tickets once and only once.

**Example**

![img](https://assets.leetcode.com/uploads/2021/03/14/itinerary1-graph.jpg)
```
Input: tickets = [["MUC","LHR"],["JFK","MUC"],["SFO","SJC"],["LHR","SFO"]]
Output: ["JFK","MUC","LHR","SFO","SJC"]
```

```javascript
/**
 * @param {string[][]} tickets
 * @return {string[]}
 */
var findItinerary = function(tickets) {
  let path = ['JFK'];
  let ans = [];
  let found = false;
  let visited = [...Array(tickets.length).fill(false)];
  tickets.sort((a,b) => {
    if (a < b) return -1;
    return 1;
  })
  backtracking("JFK");
  return ans;
  
  function backtracking(departure) {
    if (path.length === tickets.length + 1) {
      ans.push(...path);
      found = true;
      return;
    }
    for (let i = 0; i < tickets.length && !found; i++) {
      if (tickets[i][0] !== departure || visited[i]) continue;
      visited[i] = true;
      path.push(tickets[i][1]);
      backtracking(path[path.length-1]);
      visited[i] = false;
      path.pop();
    }
  }
};
```