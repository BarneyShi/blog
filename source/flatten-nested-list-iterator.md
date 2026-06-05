---
title: Leetcode 341 - Flatten nested list iterator
date: 2021-10-30 23:42:21
tags:
- array
- stack
---
**`Note:`**
- Have to use `getInteger` and `getList`, otherwise it won't work.
- Use `stack` to store `nestedList`.
- Because we call `hasNext` before `next` every time, so we can flatten the `top` of the stack at that time.
- Iterate backwards on `top` element, and stop when `this.stack.top.isInteger == true`.
- Be careful about `[[]]`. We need an exception check before iterating.

**`Question:`**

You are given a nested list of integers nestedList. Each element is either an integer or a list whose elements may also be integers or other lists. Implement an iterator to flatten it.

Implement the NestedIterator class:

- `NestedIterator(List<NestedInteger> nestedList)` Initializes the iterator with the nested list `nestedList`.
- `int next()` Returns the next integer in the nested list.
- `boolean hasNext()` Returns true if there are still some integers in the nested list and false otherwise.

Your code will be tested with the following pseudocode:

```
initialize iterator with nestedList
res = []
while iterator.hasNext()
    append iterator.next() to the end of res
return res
```
If `res` matches the expected flattened list, then your code will be judged as correct.

**`Example:`**
```
Input: nestedList = [[1,1],2,[1,1]]
Output: [1,1,2,1,1]
Explanation: By calling next repeatedly until hasNext returns false, the order of elements returned by next should be: [1,1,2,1,1].
```

**`Code:`**
```javascript
/**
 * // This is the interface that allows for creating nested lists.
 * // You should not implement it, or speculate about its implementation
 * function NestedInteger() {
 *
 *     Return true if this NestedInteger holds a single integer, rather than a nested list.
 *     @return {boolean}
 *     this.isInteger = function() {
 *         ...
 *     };
 *
 *     Return the single integer that this NestedInteger holds, if it holds a single integer
 *     Return null if this NestedInteger holds a nested list
 *     @return {integer}
 *     this.getInteger = function() {
 *         ...
 *     };
 *
 *     Return the nested list that this NestedInteger holds, if it holds a nested list
 *     Return null if this NestedInteger holds a single integer
 *     @return {NestedInteger[]}
 *     this.getList = function() {
 *         ...
 *     };
 * };
 */
/**
 * @constructor
 * @param {NestedInteger[]} nestedList
 */
var NestedIterator = function (nestedList) {
  this.stack = [];
  for (let i = nestedList.length - 1; i >= 0; i--) {
    this.stack.push(nestedList[i]);
  }
};


/**
 * @this NestedIterator
 * @returns {boolean}
 */
NestedIterator.prototype.hasNext = function () {
  if (len === 0) return false;
  while (this.stack.length > 0) {
    const top = this.stack[this.stack.length - 1];
    // Edge case check
    if (!top) {
      this.stack.pop();
      continue;
    }
    if (top.isInteger()) {
      return true;
    } else {
      const cur = top.getList();
      this.stack.pop();
      for (let i = cur.length - 1; i >= 0; i--) {
        this.stack.push(cur[i]);
      }
    }
  }
};

/**
 * @this NestedIterator
 * @returns {integer}
 */
NestedIterator.prototype.next = function () {
  const top = this.stack.pop();
  return top.getInteger();
};

/**
 * Your NestedIterator will be called like this:
 * var i = new NestedIterator(nestedList), a = [];
 * while (i.hasNext()) a.push(i.next());
*/
```