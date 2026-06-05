---
title: Leetcode 1705 - Maximum Number of Eaten Apples
date: 2021-12-23 19:07:43
tags:
- greedy
- heap
---
**`Note:`**
- How to be greedy? Eat apples that will rot earliest.
- Construct a `minPriorityQueue`, and store apples[i] like `{count: apples[i], days: days[i]}`.
- At the beginning of every day, pop out elements whose `days === 0 || count === 0`.
- After eating an apple, minus 1 to the count of heap top.

**`Question:`**

There is a special kind of apple tree that grows apples every day for `n` days. On the `ith` day, the tree grows `apples[i]` apples that will rot after `days[i]` days, that is on day `i + days[i]` the apples will be rotten and cannot be eaten. On some days, the apple tree does not grow any apples, which are denoted by `apples[i] == 0` and `days[i] == 0`.

You decided to eat at most one apple a day (to keep the doctors away). Note that you can keep eating after the first n days.

Given two integer arrays `days` and `apples` of length `n`, return the maximum number of apples you can eat.

**`Example:`**
```
Input: apples = [1,2,3,5,2], days = [3,2,1,4,2]
Output: 7
Explanation: You can eat 7 apples:
- On the first day, you eat an apple that grew on the first day.
- On the second day, you eat an apple that grew on the second day.
- On the third day, you eat an apple that grew on the second day. After this day, the apples that grew on the third day rot.
- On the fourth to the seventh days, you eat apples that grew on the fourth day.
```

**`Code:`**
```javascript
/**
 * @param {number[]} apples
 * @param {number[]} days
 * @return {number}
 */
 var eatenApples = function(apples, days) {
  let minHeap = new MinPriorityQueue_((o1, o2) => o1.days < o2.days);
  let ans = 0;

  for (let i = 0; i < apples.length; i++) {
    if (minHeap.size() > 0) minHeap.heap.forEach((e, i) => minHeap.heap[i].days--);
    if (apples[i] > 0) {
      const apple = {count : apples[i], days: days[i]};
      minHeap.insert(apple);
    }
    while (minHeap.size() > 0 && (minHeap.peek().days <= 0 || minHeap.peek().count <= 0)) {
      minHeap.pop();
    }
    if (minHeap.size() > 0) {
      minHeap.heap[0].count--;
      ans++;
    }
  }
  while(minHeap.size() > 0) {
    minHeap.heap.forEach((e, i) => minHeap.heap[i].days--);    
    while(minHeap.size() > 0 && (minHeap.peek().days <= 0 || minHeap.peek().count <= 0)) {
      minHeap.pop();
    }
    if (minHeap.size() === 0) break;
    ans += 1;
    minHeap.heap[0].count--;
  }
  return ans;
};

/** MinHeap Template **/
class MinPriorityQueue_ {
  constructor(comparator) {
    this.heap = [];
    this.comparator = comparator;
  }

  size() {
    return this.heap.length;
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

  peek() {
    return this.heap[0];
  }
}
```