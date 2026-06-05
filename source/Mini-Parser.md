---
title: Leetcode 385 - Mini Parser
date: 2021-12-11 16:21:08
tags:
- stack
---
**`Note:`**
- Prefer `stack` over `recursion` coz you can have access to the last NestedInteger.
- Note: 
  - Need to create an NI even for integers. Don't just add them to a parent NI.
  - Need a `str` to record cur number.
- Handle edge case with pure ints like `321` first.
- When `s[i] === [`, create an NI then push it to `stack`.
- When `s[i] === ]`, the `top NI` of `stack` has been finished, `pop` it, then `add` it to the next top NI. `Reset` `str` after.
- When `s[i] === ,` the `cur num` has been finished, add `str` to the `top NI` of stack. `Reset` str after.
- Otherwise, keep appending `s[i]` to str.

**`Question:`**

Given a string s represents the serialization of a nested list, implement a parser to deserialize it and return the deserialized `NestedInteger`.

Each element is either an integer or a list whose elements may also be integers or other lists.

**`Example:`**
```
Input: s = "324"
Output: 324
Explanation: You should return a NestedInteger object which contains a single integer 324.
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
 *     Set this NestedInteger to hold a single integer equal to value.
 *     @return {void}
 *     this.setInteger = function(value) {
 *         ...
 *     };
 *
 *     Set this NestedInteger to hold a nested list and adds a nested integer elem to it.
 *     @return {void}
 *     this.add = function(elem) {
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
 * @param {string} s
 * @return {NestedInteger}
 */
var deserialize = function(s) {
  if (s[0] !== '[') return new NestedInteger(parseInt(s));
  let stack = [];
  let str = '';
  for (let i = 0; i < s.length; i++) {
    if (s[i] === '[') {
      const nestInteger = new NestedInteger();
      stack.push(nestInteger);
    } else if (s[i] === ']') {
      let top = stack.pop();
      if (str.length > 0) {
        top.add(new NestedInteger(parseInt(str)));
        str = '';
      }
      if (stack.length === 0) return top;
      stack[stack.length - 1].add(top);
    } else if (s[i] === ',') {
      if (str.length > 0) {
        stack[stack.length - 1].add(new NestedInteger(parseInt(str)));
      }
      str = '';
    } else {
      str += s[i];
    }
  }
};
```