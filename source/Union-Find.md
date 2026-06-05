---
title: Data structure - 🧑‍🏫 Union Find
date: 2021-12-15 01:58:05
tags:
- union find
---

![img](https://i.imgur.com/0WgI1rR.png)

- Introduction - What's the point of using `Union Find`?
  - Quickly detect whethere there is a `cycle` inside a `graph`.
  - Check if `a`, `b` are in the same subsets, just check if `find(a) === find(b)`.

- Compare `disjoint set` to `heap`, both of them are actually `arraies`, but logically treated as `tree`/`graph`.

- Optimization:
  - Path compression:
    - Avoid traversing all the way up to find `root` of a given node, we could just set `parent[i] = root` to flatten the tree. It can be acheived by `while loop` or `recursion`.
  - Union by rank:
    - Imagine this worst case:
      - ![img](https://i.imgur.com/aWMEvx4.png)
      - The depth of tree is increasing all the time, and the time complexity of `find(x)` will be increased as well.
      - To avoid this, we use a `rank[]` to record the `depth` of each node.
      - While doing `union(x, y)`, we only `append shorter tree to higher tree`.


```javascript
class UnionFind {
  constructor(n) {
    this.parent = new Array(n).fill(-1);
    this.rank = new Array(n).fill(0);
    while (n--) {
      this.parent[n] = n;
    }
  }

  /**
   * @description Find the root of given vertex.
   * @param {*} x 
   * @returns 
   */
  find(x) {
    let xRoot = x;
    while (xRoot !== this.parent[xRoot]) {
      xRoot = this.parent[xRoot];
    }
    return xRoot;
  }

  /**
   * @description Return 0 if union failed, 1 if successfully.
   * @param {*} x 
   * @param {*} y 
   * @param {*} parent 
   * @param {*} rank 
   */
  union(x, y, parent, rank) {
    const xRoot = this.find(x);
    const yRoot = this.find(y);
    if (xRoot === yRoot) {
      return 0;
    } else {
      if (rank[xRoot] > rank[yRoot]) {
        parent[yRoot] = xRoot;
      } else if (rank[xRoot] < rank[yRoot]) {
        parent[xRoot] = yRoot;
      } else {
        parent[xRoot] = yRoot;
        rank[yRoot]++;
      }
      return 1;
    }
    
  }
}

// Initialize
let edges = [[1,2], [2,3], [3,4], [5,3], [5,4], [6,3]];
let uf = new UnionFind(6);
for (const [a, b] of edges) {
  const aRoot = uf.find(a);
  const bRoot = uf.find(b);
  if (!uf.union(aRoot, bRoot, uf.parent, uf.rank)) {
    console.log('Cycle dectected!');
    return;
  }
}
console.log('No cycles found!');
```