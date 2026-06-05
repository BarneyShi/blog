---
title: Leetcode 2034 - Stock Price Fluctuation
date: 2022-01-22 14:24:25
tags:
- priority queue
---
**`Note:`**
- To quickly get `max` and `min` from a series of data, we should consider priority queue.
- And because some data would be updated, so we need a `hash table` to maintain the `correct price`.
- So when we get `{timestamp, price}` form pq, if the price is not correct, it means the obj is stale and we should pop it and move to the next top of the pq.

**`Question:`**

You are given a stream of records about a particular stock. Each record contains a `timestamp` and the corresponding `price` of the stock at that timestamp.

Unfortunately due to the volatile nature of the stock market, the records do not come in order. Even worse, some records may be incorrect. Another record with the same timestamp may appear later in the stream correcting the price of the previous wrong record.

Design an algorithm that:

- Updates the price of the stock at a particular timestamp, correcting the price from any previous records at the timestamp.
- Finds the latest price of the stock based on the current records. The latest price is the price at the latest timestamp recorded.
- Finds the maximum price the stock has been based on the current records.
- Finds the minimum price the stock has been based on the current records.

Implement the StockPrice class:

- `StockPrice()` Initializes the object with no price records.
- `void update(int timestamp, int price)` Updates the price of the stock at the given timestamp.
- `int current()` Returns the latest price of the stock.
- `int maximum()` Returns the maximum price of the stock.
- `int minimum()` Returns the minimum price of the stock.

**`Example:`**
```
Input
["StockPrice", "update", "update", "current", "maximum", "update", "maximum", "update", "minimum"]
[[], [1, 10], [2, 5], [], [], [1, 3], [], [4, 2], []]
Output
[null, null, null, 5, 10, null, 5, null, 2]

Explanation
StockPrice stockPrice = new StockPrice();
stockPrice.update(1, 10); // Timestamps are [1] with corresponding prices [10].
stockPrice.update(2, 5);  // Timestamps are [1,2] with corresponding prices [10,5].
stockPrice.current();     // return 5, the latest timestamp is 2 with the price being 5.
stockPrice.maximum();     // return 10, the maximum price is 10 at timestamp 1.
stockPrice.update(1, 3);  // The previous timestamp 1 had the wrong price, so it is updated to 3.
                          // Timestamps are [1,2] with corresponding prices [3,5].
stockPrice.maximum();     // return 5, the maximum price is 5 after the correction.
stockPrice.update(4, 2);  // Timestamps are [1,2,4] with corresponding prices [3,5,2].
stockPrice.minimum();     // return 2, the minimum price is 2 at timestamp 4.
```

**`Code:`**
```javascript
var StockPrice = function() {
  this.map = new Map();
  this.maxPQ = new PriorityQueue((o1, o2) => o1.price > o2.price);
  this.minPQ = new PriorityQueue((o1, o2) => o1.price < o2.price);
  this.maxTimestamp = 0;
};

/** 
 * @param {number} timestamp 
 * @param {number} price
 * @return {void}
 */
StockPrice.prototype.update = function(timestamp, price) {
  if (timestamp > this.maxTimestamp) this.maxTimestamp = timestamp;
  this.map.set(timestamp, price);
  this.maxPQ.insert({timestamp, price});
  this.minPQ.insert({timestamp, price});
};

/**
 * @return {number}
 */
StockPrice.prototype.current = function() {
  return this.map.get(this.maxTimestamp);
};

/**
 * @return {number}
 */
StockPrice.prototype.maximum = function() {
  while (this.maxPQ.heap[0].price !== this.map.get(this.maxPQ.heap[0].timestamp)) {
    this.maxPQ.pop();
  }
  return this.maxPQ.heap[0].price;
};

/**
 * @return {number}
 */
StockPrice.prototype.minimum = function() {
  while (this.minPQ.heap[0].price !== this.map.get( this.minPQ.heap[0].timestamp)) {
    this.minPQ.pop();
  }
  return this.minPQ.heap[0].price;
};

class PriorityQueue {
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


/**
 * Your StockPrice object will be instantiated and called as such:
 * var obj = new StockPrice()
 * obj.update(timestamp,price)
 * var param_2 = obj.current()
 * var param_3 = obj.maximum()
 * var param_4 = obj.minimum()
 */
```