---
title: Leetcode 155 - Min stack
date: 2021-08-18 23:11:50
tags:
- leetcode
- array
---
Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.

   Implement the `MinStack` class:

   - `MinStack()` initializes the stack object.
   - `void push(val)` pushes the element `val` onto the stack.
   - `void pop()` removes the element on the top of the stack.
   - `int top()` gets the top element of the stack.
   - `int getMin()` retrieves the minimum element in the stack.

   **Note**: To save time, you have to spend extra space.

   - `Don't insert element into Min Stack if it's not smaller than the top one. If you think about using for loops. That's not O(1)`

   ```javascript
   /**
    * initialize your data structure here.
    */
   var MinStack = function() {
     this.stack = [];
     this.minStack = [];
   };
   
   /** 
    * @param {number} val
    * @return {void}
    */
   MinStack.prototype.push = function(val) {
     if (this.minStack.length === 0 || val <= this.minStack[this.minStack.length-1]) {
       this.minStack.push(val);
     }
     this.stack.push(val);
     
   };
   
   /**
    * @return {void}
    */
   MinStack.prototype.pop = function() {
     const e = this.stack.pop();
     // This way to pop is wrong, just image you insert -2. -4, -2, and the min stack will be like -2, -4
     // If you pop, then min stack would be -4. But you definitely cannot pop that -2.
     // const idx = this.minStack.indexOf(e);
     // if (idx) {
     //   this.minStack.splice(idx, 1);
     // }
     if (e === this.minStack[this.minStack.length - 1]) {
       this.minStack.pop();
     }
   };
   
   /**
    * @return {number}
    */
   MinStack.prototype.top = function() {
     return this.stack[this.stack.length-1];
   };
   
   /**
    * @return {number}
    */
   MinStack.prototype.getMin = function() {
     return this.minStack[this.minStack.length-1];
   };
   ```

