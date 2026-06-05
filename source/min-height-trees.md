---
title: Leetcode 310 - Min height trees
date: 2021-12-05 20:06:16
tags:
- topological sort
- bfs
---
**`Note:`**
- What kind of node should be chosen as our `root`?
- Nodes with `indegree == 1` can be seen as leaves. Those are def not what we want.
- Why? Image a path from one leaf from another leaf is like `l1 - a - b - c - l2`. Here `b` is the center and `distance(b, l1) < distance(l1, l2)`, `distance(b, l2) < distance(l1, l2)`.
- If we pick any `interior node`, its distance to any `leaf` node will be shorter than picking a `leaf` node as the root.
- The more `inside` a node is, the shorter the path is to our `leaf` nodes.
- Use a `map` to store `edges`.
- Use `queue` to store current `leaf` nodes.
- Every time we pop out a `leaf` and minus `1` from its adjacent nodes. If its neighbor's `indegree === 1`, add them to the `queue`.
- We need a `res` var to store the result. In each iteration of `BFS`, we clear `res` first, then we add popped nodes into `res`. 
- After the last round of iteration, the result will be in `res`.

**`Question:`**

A tree is an undirected graph in which any two vertices are connected by exactly one path. In other words, any connected graph without simple cycles is a tree.

Given a tree of `n` nodes labelled from `0` to `n - 1`, and an array of `n - 1`` edges` where `edges[i] = [ai, bi]` indicates that there is an undirected edge between the two nodes `ai` and `bi` in the tree, you can choose any node of the tree as the root. When you select a node `x` as the root, the result tree has height `h`. Among all possible rooted trees, those with minimum height (i.e. `min(h)`)  are called minimum height trees (MHTs).

Return `a list` of all MHTs' root labels. You can return the answer in any order.

The `height` of a rooted tree is the number of edges on the longest downward path between the root and a leaf.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2020/09/01/e1.jpg)
```
Input: n = 4, edges = [[1,0],[1,2],[1,3]]
Output: [1]
Explanation: As shown, the height of the tree is 1 when the root is the node with label 1 which is the only MHT.
```

**`Code:`**
```javascript
/**
 * @param {number} n
 * @param {number[][]} edges
 * @return {number[]}
 */
var findMinHeightTrees = function (n, edges) {
    if (n === 1) return [0];
    let indegree = [...Array(n).fill(0)];
    let map = new Map();
    for (let i = 0; i < edges.length; i++) {
        const a = edges[i][0];
        const b = edges[i][1];
        indegree[a]++;
        indegree[b]++;

        if (!map.has(a)) {
            map.set(a, [b]);
        } else {
            map.set(a, [...map.get(a), b]);
        }
        if (!map.has(b)) {
            map.set(b, [a]);
        } else {
            map.set(b, [...map.get(b), a]);
        }
    }
    let queue = [];
    for (let i = 0; i < indegree.length; i++) {
        if (indegree[i] === 1) queue.push(i);
    }
    let res = [];
    while (queue.length > 0) {
        // Reset res every time.
        res = [];
        const length = queue.length;
        for (let i = 0; i < length; i++) {
            const node = queue.shift();
            res.push(node);
            indegree[node]--;
            const adjacentNodes = map.get(node);
            for (const n of adjacentNodes) {
                indegree[n]--;
                if (indegree[n] === 1) {
                    queue.push(n);
                }
            }
        }
    }
    return res;
};
```