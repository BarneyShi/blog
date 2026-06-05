---
title: Leetcode 703 - Kth Largest Element in a Stream
date: 2021-12-22 18:40:09
tags:
- heap
---
**`Note:`**
- Seems like an easy question but what they are looking at is how to use `heap`.
- Initialize a `minHeap` and add all nums.
- While adding a new num, if `heap.size > k`, we need to pop it until the size becomes `k`.
- Because every time we are popping the `min` out of the heap. When the size reaches `k`, the top of `minheap` is our <font color=green>$k^{th}$</font> largest element.

**`Question:`**

Design a class to find the $k^{th}$ largest element in a stream. Note that it is the $k^{th}$ largest element in the sorted order, not the $k^{th}$ distinct element.

Implement KthLargest class:

- `KthLargest(int k, int[] nums)` Initializes the object with the integer k and the stream of integers nums.
- `int add(int val)` Appends the integer val to the stream and returns the element representing the $k^{th}$ largest element in the stream.

**`Example:`**
```
Input
["KthLargest", "add", "add", "add", "add", "add"]
[[3, [4, 5, 8, 2]], [3], [5], [10], [9], [4]]
Output
[null, 4, 5, 5, 8, 8]

Explanation
KthLargest kthLargest = new KthLargest(3, [4, 5, 8, 2]);
kthLargest.add(3);   // return 4
kthLargest.add(5);   // return 5
kthLargest.add(10);  // return 5
kthLargest.add(9);   // return 8
kthLargest.add(4);   // return 8
```

**`Code:`**
```javascript
/**
 * @param {number} k
 * @param {number[]} nums
 */
var KthLargest = function(k, nums) {
  const minHeap = new MinHeap();
  for (const n of nums) {
    minHeap.insert(n);
  }
  this.k = k;
  this.minHeap = minHeap;
};

/** 
 * @param {number} val
 * @return {number}
 */
KthLargest.prototype.add = function(val) {
  this.minHeap.insert(val);
  while (this.minHeap.getSize() > this.k) {
    this.minHeap.pop();
  }
  return this.minHeap.peek();
};

class MinHeap{
  constructor() {
    this.heap = [];
  }
  getSize() {
    return this.heap.length;
  }
  getParentIndex(i) {
    return (i - 1) >> 1;
  }
  getLeftIndex(i) {
    return 2*i + 1;
  }
  getRightIndex(i) {
    return 2*i + 2;
  }
  shiftUp(i) {
    while (i > 0) {
      const parentIndex = this.getParentIndex(i);
      if (this.heap[i] >= this.heap[parentIndex]) break;
      [this.heap[i], this.heap[parentIndex]] = [this.heap[parentIndex], this.heap[i]];
      i = parentIndex;
    }
  }
  shiftDown(i) {
    const left = this.getLeftIndex(i);
    const right = this.getRightIndex(i);
    const size = this.getSize();
    if (left < size && this.heap[left] < this.heap[i]) {
      [this.heap[i], this.heap[left]] = [this.heap[left], this.heap[i]];
      this.shiftDown(left);
    }
    if (right < size && this.heap[right] < this.heap[i]) {
      [this.heap[i], this.heap[right]] = [this.heap[right], this.heap[i]];
      this.shiftDown(right);
    }
  }
  pop() {
    const ans = this.heap[0];
    [this.heap[0], this.heap[this.getSize() - 1]] = [this.heap[this.getSize() - 1], this.heap[0]];
    this.heap.pop();
    if (this.getSize() > 0) {
      this.shiftDown(0);
    }
    return ans;
  }
  insert(val) {
    this.heap.push(val);
    this.shiftUp(this.getSize() - 1);
  }
  peek() {
    return this.heap[0];
  }
}

/**
 * Your KthLargest object will be instantiated and called as such:
 * var obj = new KthLargest(k, nums)
 * var param_1 = obj.add(val)
 */
```