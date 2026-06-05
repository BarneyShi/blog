---
title: Leetcode 328 - Odd even linked list
date: 2021-11-16 03:33:54
tags:
- linked list
- double pointers
---
**`Note:`**
- Think about doing the same thing to an array in O(n) speed and O(1) extra space. It's kinda hard.
- What makes linked list easier? You can `ignore it's position` in the input array and just assign their `next`.
- ![img](https://i.imgur.com/JDcluZ0.png)
- Use `two pointers`, one to odd, one to even.
- Let `odd pointer` point to next `odd position`.
- Let `even pointer` point to next `even position`.
- Move them to next.
- Concat `even pointer` to `odd pointer` to connect them together.
- Return the head.

**`Question:`**

Given the `head` of a singly linked list, group all the nodes with odd indices together followed by the nodes with even indices, and return the reordered list.

The first node is considered `odd`, and the second node is `even`, and so on.

Note that the relative order inside both the even and odd groups should remain as it was in the input.

You must solve the problem in `O(1)` extra space complexity and `O(n)` time complexity.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2021/03/10/oddeven2-linked-list.jpg)
```
Input: head = [2,1,3,5,6,4,7]
Output: [2,3,6,7,1,5,4]
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
 * @return {ListNode}
 */
var oddEvenList = function(head) {
  if (!head) return head;
  // Evenhead marks where to connect odd and even linked list. But oddHead is unnecessary.
  let evenHead = head.next;
  let oddPointer = head;
  let evenPointer = evenHead;
  while (oddPointer && evenPointer && evenPointer.next) {
    oddPointer.next = evenPointer.next;
    evenPointer.next = oddPointer.next.next;
    oddPointer = oddPointer.next;
    evenPointer = evenPointer.next;
  }
  oddPointer.next = evenHead;
  return head;
};
```