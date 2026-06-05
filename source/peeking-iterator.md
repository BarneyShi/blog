---
title: Leetcode 284 - Peeking iterator
date: 2021-12-02 18:01:30
tags:
---
**`Note:`**
- Use a `this.peek` to store the next();
- Remember to reset it back to `null` after returning a `peek`.

**`Question:`**

Design an iterator that supports the `peek` operation on an existing iterator in addition to the `hasNext` and the `next` operations.

Implement the `PeekingIterator` class:

- `PeekingIterator(Iterator<int> nums)` Initializes the object with the given integer iterator iterator.
- `int next()` Returns the next element in the array and moves the pointer to the next element.
- `boolean hasNext()` Returns true if there are still elements in the array.
- `int peek()` Returns the next element in the array without moving the pointer.

Note: Each language may have a different implementation of the constructor and `Iterator`, but they all support the int `next()` and boolean hasNext() functions.

**`Example:`**
```
Input
["PeekingIterator", "next", "peek", "next", "next", "hasNext"]
[[[1, 2, 3]], [], [], [], [], []]
Output
[null, 1, 2, 2, 3, false]

Explanation
PeekingIterator peekingIterator = new PeekingIterator([1, 2, 3]); // [1,2,3]
peekingIterator.next();    // return 1, the pointer moves to the next element [1,2,3].
peekingIterator.peek();    // return 2, the pointer does not move [1,2,3].
peekingIterator.next();    // return 2, the pointer moves to the next element [1,2,3]
peekingIterator.next();    // return 3, the pointer moves to the next element [1,2,3]
peekingIterator.hasNext(); // return False
```

**`Code:`**
```javascript
/**
 * // This is the Iterator's API interface.
 * // You should not implement it, or speculate about its implementation.
 * function Iterator() {
 *    @ return {number}
 *    this.next = function() { // return the next number of the iterator
 *       ...
 *    }; 
 *
 *    @return {boolean}
 *    this.hasNext = function() { // return true if it still has numbers
 *       ...
 *    };
 * };
 */

/**
 * @param {Iterator} iterator
 */
var PeekingIterator = function(iterator) {
  this.peeks = null;
  this.iterator = iterator;
};

/**
 * @return {number}
 */
PeekingIterator.prototype.peek = function() {
  if (this.peeks !== null) return this.peeks;
  this.peeks = this.iterator.next();
  return this.peeks;
};

/**
 * @return {number}
 */
PeekingIterator.prototype.next = function() {
  if (this.peeks !== null) {
    const peek = this.peeks;
    this.peeks = null;
    return peek;
  }
  return this.iterator.next();
};

/**
 * @return {boolean}
 */
PeekingIterator.prototype.hasNext = function() {
  return this.iterator.hasNext() || this.peeks !== null;
};

/** 
 * Your PeekingIterator object will be instantiated and called as such:
 * var obj = new PeekingIterator(arr)
 * var param_1 = obj.peek()
 * var param_2 = obj.next()
 * var param_3 = obj.hasNext()
 */
```