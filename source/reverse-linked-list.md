---
title: Leetcode 206 - Reverse linked list
date: 2021-08-29 21:38:28
tags:
- leetcode
- linked list
---
**Note:** We need a `dummy` node.
![img](https://tva1.sinaimg.cn/large/008eGmZEly1gnrf1oboupg30gy0c44qp.gif)

Given the head of a singly linked list, reverse the list, and return the reversed list.

**Example 1:**
![img](https://assets.leetcode.com/uploads/2021/02/19/rev1ex1.jpg)
```
Input: head = [1,2,3,4,5]
Output: [5,4,3,2,1]
```
**Iterative**
```javascript
/**
 * Definition for singly-linked list.
 * function ListNode(val, next) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.next = (next===undefined ? null : next)
 * }
 */
/**
 * @param {ListNode} head
 * @return {ListNode}
 */
var reverseList = function(head) {
  if (!head) {
    return head;
  } 
  let cur = head, prev = null;
  while (cur) {
    let tmp = cur.next;
    cur.next = prev;
    prev = cur;
    cur = tmp;
  }
  return prev;
};
```
**Recursive**
```javascript
var reverseList = function(head) {
  return reverse(null, head);
};

var reverse = function (prev, head) {
  if (!head) {
    return prev;
  }
  let tmp = head.next;
  head.next = prev;
  prev = head;
  head = tmp;
  return reverse(prev, head);
}
```
