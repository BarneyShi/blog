---
title: Leetcode 203 - Remove linked list elements
date: 2021-08-27 01:08:45
tags:
- leetcode
- medium
- linked list
---
Given the head of a linked list and an integer val, remove all the nodes of the linked list that has Node.val == val, and return the new head.
![img](https://assets.leetcode.com/uploads/2021/03/06/removelinked-list.jpg)
```
Input: head = [1,2,6,3,4,5,6], val = 6
Output: [1,2,3,4,5]
```
**Note:** We don't really need double pointers to solve this because the memory of linked lists is not really consecutive. Just using one `pointer` to iterate is enough.
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
 * @param {number} val
 * @return {ListNode}
 */
var removeElements = function(head, val) {
  let dummy = new ListNode(0, head);
  let pointer = dummy;
  if (!head) return null;
  while (pointer.next) {
    if (pointer.next.val === val) {
      pointer.next = pointer.next.next;
      continue;
    }
    pointer = pointer.next;
  }
  return dummy.next;
};
```
