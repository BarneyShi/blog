---
title: Leetcode 143 - Reorder list
date: 2021-11-29 00:03:44
tags:
- linked list
- double pointers
---
**`Note:`**
- Find the middle nodes, and separate the first half and the second half.
- Reverse the second half.
- Merge them together alternatively.

**`Question:`**

You are given the head of a singly linked-list. The list can be represented as:
```
L0 → L1 → … → Ln - 1 → Ln
```
Reorder the list to be on the following form:
```
L0 → Ln → L1 → Ln - 1 → L2 → Ln - 2 → …
```
You may not modify the values in the list's nodes. Only nodes themselves may be changed.

**`Example:`**
![img](https://assets.leetcode.com/uploads/2021/03/04/reorder1linked-list.jpg)
```
Input: head = [1,2,3,4]
Output: [1,4,2,3]
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
 * @param {ListNode} head
 * @return {void} Do not return anything, modify head in-place instead.
 */
var reorderList = function(head) {
  const middleNode = findMiddleNode(head);
  const nextHead = middleNode.next;
  middleNode.next = null;
  const reversedList = reverseList(nextHead);
  return mergeList(head, reversedList);


  function findMiddleNode(node) {
    let slow = node;
    let fast = node;
    while (fast && fast.next && fast.next.next) {
      slow = slow.next;
      fast = fast.next.next;
    }
    return slow;
  }

  function reverseList(node) {
    let prev = null;
    let curr = node;
    while (curr) {
      let tmp = curr.next;
      curr.next = prev;
      prev = curr;
      curr = tmp;
    }
    return prev;
  }

  function mergeList(node1, node2) {
    let p1 = node1;
    let p2 = node2;
    while (p1 && p2) {
      let tmp = p1.next;
      let tmp2 = p2.next;
      p1.next = p2;
      p2.next = tmp;
      p2 = tmp2;
      p1 = tmp;
    }
    return node1;
  }
};
```