---
title: Leetcode 225 - Implement stack using queues
date: 2021-10-09 18:52:15
tags:
- stack
---
**`Note:`**
- Because we are using queues, we can only use `push` and `shift` (To get the first element). 
- DO NOT use `pop`.
- One queue is enough for implementation.

**`Question:`**
Implement a last-in-first-out (LIFO) stack using only two queues. The implemented stack should support all the functions of a normal stack (push, top, pop, and empty).

Implement the MyStack class:

- void push(int x) Pushes element x to the top of the stack.
- int pop() Removes the element on the top of the stack and returns it.
- int top() Returns the element on the top of the stack.
- boolean empty() Returns true if the stack is empty, false otherwise.

Notes:

You must use only standard operations of a queue, which means that only push to back, peek/pop from front, size and is empty operations are valid.
Depending on your language, the queue may not be supported natively. You may simulate a queue using a list or deque (double-ended queue) as long as you use only a queue's standard operations.

**`Example:`**
```
Input
["MyStack", "push", "push", "top", "pop", "empty"]
[[], [1], [2], [], [], []]
Output
[null, null, null, 2, 2, false]

Explanation
MyStack myStack = new MyStack();
myStack.push(1);
myStack.push(2);
myStack.top(); // return 2
myStack.pop(); // return 2
myStack.empty(); // return False
```

**`Code:`**
```javascript
var MyStack = function() {
  this.queue = [];
};

/** 
 * @param {number} x
 * @return {void}
 */
MyStack.prototype.push = function(x) {
  this.queue.push(x);
};

/**
 * @return {number}
 */
MyStack.prototype.pop = function() {
  let length = this.queue.length;
  while(length-- > 1) {
    this.push(this.queue.shift());
  }
  return this.queue.shift();
};

/**
 * @return {number}
 */
MyStack.prototype.top = function() {
  const res = this.pop();
  this.push(res);
  return res;
};

/**
 * @return {boolean}
 */
MyStack.prototype.empty = function() {
  return !this.queue.length;
};

/**
 * Your MyStack object will be instantiated and called as such:
 * var obj = new MyStack()
 * obj.push(x)
 * var param_2 = obj.pop()
 * var param_3 = obj.top()
 * var param_4 = obj.empty()
 */
```