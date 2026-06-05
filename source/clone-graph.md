---
title: Leetcode 133 - Clone graph
date: 2021-11-28 21:34:02
tags:
- bfs
- dfs
---
**`Note:`**
- `BFS`
  - How to map nodes to newly cloned nodes? Use `Map`.
  - At first, I wrongfully used `two queues`, one for old nodes, the other for new nodes. But I didn't realize that in this way, I can't preserve the relations between old nodes and new nodes.
  - Use a `queue` as in BFS.
  - Because there might be loops, use `map.has(node)` to check if it has been iterated.
- `DFS`
  - Base case:
    - Node is `null`
    - Node is in `map`, which means it's been cloned before. So just return `map.get(node)`.
  - Return type?
    - Cloned nodes.
  - What to do in each recursion?
    - Create a cloned node for current node.
    - For each `child` of curr node, do `DFS(child)` on them to get cloned node.
    - Push cloned children into current node's clone.

**`Question:`**

Given a reference of a node in a `connected` undirected graph.

Return a `deep copy` (clone) of the graph.

Each node in the graph contains a value (`int`) and a list (List[Node]) of its neighbors.
```
class Node {
    public int val;
    public List<Node> neighbors;
}
```

**`Example:`**
![img](https://assets.leetcode.com/uploads/2019/11/04/133_clone_graph_question.png)
```
Input: adjList = [[2,4],[1,3],[2,4],[1,3]]
Output: [[2,4],[1,3],[2,4],[1,3]]
Explanation: There are 4 nodes in the graph.
1st node (val = 1)'s neighbors are 2nd node (val = 2) and 4th node (val = 4).
2nd node (val = 2)'s neighbors are 1st node (val = 1) and 3rd node (val = 3).
3rd node (val = 3)'s neighbors are 2nd node (val = 2) and 4th node (val = 4).
4th node (val = 4)'s neighbors are 1st node (val = 1) and 3rd node (val = 3).
```

**`Code:`**
```javascript
/**
 * // Definition for a Node.
 * function Node(val, neighbors) {
 *    this.val = val === undefined ? 0 : val;
 *    this.neighbors = neighbors === undefined ? [] : neighbors;
 * };
 */

/**
 * @param {Node} node
 * @return {Node}
 */
var cloneGraph = function (node) {
  if (!node) return null;

  let map = new Map();
  let queue = [node];
  map.set(node, new Node(node.val));
  while (queue.length) {
    const length = queue.length;
    for (let i = 0; i < length; i++) {
      const first = queue.shift();
      const newFirst = map.get(first);
      for (const child of first.neighbors) {
        if (map.has(child)) {
          newFirst.neighbors.push(map.get(child));
        } else {
          const newChild = new Node(child.val);
          newFirst.neighbors.push(newChild);
          queue.push(child);
          map.set(child, newChild);
        }
      }
    }
  }
  return map.get(node);
};
```

**`DFS`**
```javascript
/**
 * // Definition for a Node.
 * function Node(val, neighbors) {
 *    this.val = val === undefined ? 0 : val;
 *    this.neighbors = neighbors === undefined ? [] : neighbors;
 * };
 */

/**
 * @param {Node} node
 * @return {Node}
 */
var cloneGraph = function(node) {
  let map = new Map();
  return dfs(node);

  function dfs(root) {
    if (!root) return null;
    if (map.has(root)) return map.get(root);
    const clone = new Node(root.val);
    map.set(root, clone);
    for (const child of root.neighbors) {
      const node = dfs(child);
      clone.neighbors.push(node);
    }
    return map.get(root);
  }
};
```