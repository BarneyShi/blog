---
title: Leetcode 232 - Implement queue using stacks
date: 2021-10-09 17:38:58
tags:
- queue
---
**`Note:`**
- DO NOT use methods like `slice`, `splice`, or just assigning values based on `index`. That's not using stack! 
- Use `pop` because what we get will be the last element added.
- Use `2 stacks (arrays)` with methods like `pop()`, `push()`.
- `StackIn` is the stack to push to when you want to insert.
- `StackOut` is the stack to contain `reversed` elements from `stackIn`. In that way, when we do `pop` on stackOut, what we get will be the first element of `stackIn`.
- Learn to reuse methods that we've implemented.

**`Question:`**
Implement a first in first out (FIFO) queue using only two stacks. The implemented queue should support all the functions of a normal queue (push, peek, pop, and empty).

Implement the MyQueue class:

- void push(int x) Pushes element x to the back of the queue.
- int pop() Removes the element from the front of the queue and returns it.
- int peek() Returns the element at the front of the queue.
- boolean empty() Returns true if the queue is empty, false otherwise.

Notes:

- You must use only standard operations of a stack, which means only push to top, peek/pop from top, size, and is empty operations are valid.
- Depending on your language, the stack may not be supported natively. You may simulate a stack using a list or deque (double-ended queue) as long as you use only a stack's standard operations.

**`Example:`**
```
Input
["MyQueue", "push", "push", "peek", "pop", "empty"]
[[], [1], [2], [], [], []]
Output
[null, null, null, 1, 1, false]

Explanation
MyQueue myQueue = new MyQueue();
myQueue.push(1); // queue is: [1]
myQueue.push(2); // queue is: [1, 2] (leftmost is front of the queue)
myQueue.peek(); // return 1
myQueue.pop(); // return 1, queue is [2]
myQueue.empty(); // return false
```

**`Code:`**
```javascript
var MyQueue = function() {
  this.stackIn = [];
  this.stackOut = [];
};

/** 
 * @param {number} x
 * @return {void}
 */
MyQueue.prototype.push = function(x) {
  this.stackIn.push(x);
};

/**
 * @return {number}
 */
MyQueue.prototype.pop = function() {
  /* This length check is essential! */
  if (!this.stackOut.length) {
    while(this.stackIn.length) {
      this.stackOut.push(this.stackIn.pop());
    }
  }
  return this.stackOut.pop();
};

/**
 * @return {number}
 */
MyQueue.prototype.peek = function() {
  /* Resue is important */
  const res = this.pop();
  this.stackOut.push(res);
  return res;
};

/**
 * @return {boolean}
 */
MyQueue.prototype.empty = function() {
  return !this.stackOut.length && !this.stackIn.length;
};

/**
 * Your MyQueue object will be instantiated and called as such:
 * var obj = new MyQueue()
 * obj.push(x)
 * var param_2 = obj.pop()
 * var param_3 = obj.peek()
 * var param_4 = obj.empty()
 */
```