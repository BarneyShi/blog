---
title: Leetcode 445 - Add two nums II
date: 2021-10-31 23:25:09
tags:
- stack
- linked list
---
**`Note:`**
- Reversing linked lists are too naive.
- Use `stacks` to store vals and sum them up while popping them out.

**`Question:`**

You are given two non-empty linked lists representing two non-negative integers. The most significant digit comes first and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2021/04/09/sumii-linked-list.jpg)
```
Input: l1 = [7,2,4,3], l2 = [5,6,4]
Output: [7,8,0,7]
```

**`Code:`**
```javascript
/**
 * Definition for singly-linked list.
 * function ListNode(val, next) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.next = (next===undefined ? null : next)
 * }
 */
/**
 * @param {ListNode} l1
 * @param {ListNode} l2
 * @return {ListNode}
 */
var addTwoNumbers = function (l1, l2) {
  let stack1 = [];
  let stack2 = [];
  let p = l1;
  while (p) {
    stack1.push(p.val);
    p = p.next;
  }
  p = l2;
  while (p) {
    stack2.push(p.val);
    p = p.next;
  }
  let prev = 0;
  let prevNode = null;
  while (stack1.length > 0 || stack2.length > 0) {
    const sum = prev + (stack1.length ? stack1.pop() : 0) + ((stack2.length > 0) ? stack2.pop() : 0);
    let curNode;
    if (sum > 9) {
      prev = 1;
      curNode = new ListNode(sum - 10);
    } else {
      prev = 0;
      curNode = new ListNode(sum); 
    }
    curNode.next = prevNode;
    prevNode = curNode;
  }
  if (prev !== 0) {
    const lastNode = new ListNode(1);
    lastNode.next = prevNode;
    return lastNode;
  }
  return prevNode;
};
```