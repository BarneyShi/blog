---
title: Data structure - 🆎 Heap & 📈 Priority Queue
date: 2021-11-28 16:22:09
tags:
- heap
- priority queue
---
Heap is actually `an array` physically, but logically it's a tree-based data structure. 
We often use `MinPriorityQueue` and `MaxPriorityQueue` in JavaScript.

![img](https://i.imgur.com/o9lSXNa.png)

```
Background knowledge:
  ParentIndex = (i - 1) >> 1;
  LeftChildIndex = 2*i + 1;
  RightChildIndex = 2*i + 2;

  Proof:
    Assume node with index `i` is on (n-1)th level, and there are `x` nodes `before` it on n-th level.
    Then, we can say `totalNodesBeforei = 2^(n - 1) - 1 + x = i`.
    On nth level, before its left, there will be `2x` node.
    `totalNodesBeforeJ = 2^n - 1 + 2x = 2*(2^(n-1) - 1 + x) + 1` = 2*i + 1. 
```

**`MinHeap implementation`**
```javascript
class MinHeap {
  constructor() {
    this.heap = [];
  }

  swap(i, j) {
    [this.heap[i], this.heap[j]] = [this.heap[j], this.heap[i]];
  }
  
  getParentIndex (i) {
    return (i - 1) >> 1;
  }

  getLeftIndex(i) {
    return i * 2 + 1;
  }
  
  getRightIndex(i) {
    return i * 2 + 2;
  }

  shiftUp(i) {
    if (i === 0) return;
    const parentIndex = this.getParentIndex(i);
    if (this.heap[i] < this.heap[parentIndex]) {
      this.swap(i, parentIndex);
      this.shiftUp(parentIndex);
    }
  }

  shiftDown(i) {
    const leftIndex = this.getLeftIndex(i);
    const rightIndex = this.getRightIndex(i);
    if (leftIndex < this.heap.length && this.heap[leftIndex] < this.heap[i]) {
      this.swap(leftIndex, i);
      this.shiftDown(leftIndex);
    }
    if (rightIndex < this.heap.length && this.heap[rightIndex] < this.heap[i]) {
      this.swap(rightIndex, i);
      this.shiftDown(rightIndex);
    }
  }

  insert(val) {
    this.heap.push(val);
    this.shiftUp(this.heap.length - 1);
  }

  pop() {
    const first = this.heap[0];
    const last = this.heap.pop();
    if (this.heap.length !== 0) {
      this.heap[0] = last;
      this.shiftDown(0);
    }
    return first;
  }

  peek() {
    return this.heap[0];
  }

  size() {
    return this.heap.length;
  }
}
```

**`Min/Max Priority Queue`**

Note: 
PQ is quite simimlar to normal binary `heaps`, but the element can be `objects` but no just `numbers`. And sometimes we need more complex `comparator` to diff priorities. Hence a `comparator` is necessary in constructor.
```javascript
class MinPriorityQueue {
  constructor(comparator) {
    this.heap = [];
    this.comparator = comparator;
  }

  swap(i, j) {
    [this.heap[i], this.heap[j]] = [this.heap[j], this.heap[i]];
  }

  parentIndex(i) {
    return (i - 1) >> 1;
  }

  leftChildIndex(i) {
    return 2*i + 1;
  }

  rightChildIndex(i) {
    return 2*i + 2;
  }
  
  insert(element) {
    this.heap.push(element);
    let index = this.heap.length - 1;
    let parentIndex = this.parentIndex(index);

    while (parentIndex >= 0 && this.comparator(this.heap[index], this.heap[parentIndex])) {
      this.swap(index, parentIndex);
      index = parentIndex;
      parentIndex = this.parentIndex(index);
    }
  }

  pop() {
    const ans = this.heap[0];
    this.swap(0, this.heap.length - 1);
    this.heap.pop();

    let index = 0;
    let leftChildIndex = this.leftChildIndex(index);
    let rightChildIndex = this.rightChildIndex(index);

    while (leftChildIndex < this.heap.length || rightChildIndex < this.heap.length) {
      let nextIndex = null;
      if (this.comparator(this.heap[leftChildIndex], this.heap[index])) {
        nextIndex = leftChildIndex;
      }
      if (rightChildIndex < this.heap.length && this.comparator(this.heap[rightChildIndex], this.heap[leftChildIndex])) {
        nextIndex = rightChildIndex;
      }
      // No child has lower priority than heap[index], break the loop.
      if (nextIndex === null) break;

      this.swap(index, nextIndex);
      index = nextIndex;
      leftChildIndex = this.leftChildIndex(index);
      rightChildIndex = this.rightChildIndex(index);
    }
    return ans;
  }
}

// For example:
let  pq = new MinPriorityQueue((o1, o2) => o1.sum < o2.sum);
let o1 = {item: [1,2], sum: 3};
let o2 = {itm: [-1,-2], sum: -3};
pq.insert(o1);
pq.insert(o2);
while (pq.heap.length > 0) {
  console.log(pq.pop());
}
```

**`Time complexity`**

![img](https://i.imgur.com/EwGEWof.png)