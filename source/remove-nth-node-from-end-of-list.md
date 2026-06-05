---
title: Leetcode 19 - Remove nth node from end of list
date: 2021-10-11 21:23:20
tags:
- linked list
- double pointers
---
**`Note:`**
- It's a 2-pointer question, but needs a little trick.
- Need a little `dummy` to deal with situations when we want to remove `head`.
- Set `slow` on dummy, `fast` on head.
- Let `fast` pointer move n steps beforehand, then `fast` and `slow` move together.
- When `fast` points to `null`, the next of `slow.next` is the target that we want!

**`Question:`**
Given the head of a linked list, remove the nth node from the end of the list and return its head.

**`Example:`**
![img](https://assets.leetcode.com/uploads/2020/10/03/remove_ex1.jpg)
```
Input: head = [1,2,3,4,5], n = 2
Output: [1,2,3,5]
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
 * @param {number} n
 * @return {ListNode}
 */
var removeNthFromEnd = function(head, n) {
  const dummy = new ListNode();
  dummy.next = head;
  let slow = dummy;
  let fast = head;
  for (let i = 0; i < n; i++) {
    fast = fast.next;
  }
  while (fast) {
    slow = slow.next;
    fast = fast.next;
  }
  slow.next = slow.next.next;
  return dummy.next;
};
```