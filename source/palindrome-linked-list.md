---
title: Leetcode 234 - Palindrome linked list
date: 2021-10-18 00:37:56
tags:
---
**`Note:`**
- For `O(1)` space solution, we need to reverse second half linked list then use double pointers.
- How to reverse the second half list? `Fast and slow` pointers.
  - Because `fast` moves twice faster than `slow`. If the length is `odd`, `fast` will be at the end. If the length is `even`, `fast` will be one node away from the end.
  - We make sure that the first half is at least as long as the second half, so it needs to `keep` the `middle` node when the length is `odd`.
- After reversing the second half, it's detached from the first half because now its `end` is `null` instead of the `middle node`.
- Use double pointers to iterate. We stop when we hit the end of `second half` because sometimes the first half can have `one more node` than the second half.

**`Question:`**

Given the `head` of a singly linked list, return `true` if it is a palindrome.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2021/03/03/pal1linked-list.jpg)
```
Input: head = [1,2,2,1]
Output: true
```

**`Code:`**
**`Double pointers - O(1) space`**
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
 * @return {boolean}
 */
var isPalindrome = function(head) {
  const middleNode = findMiddleNode(head);
  const endNode = reverseList(middleNode.next);

  let left = head;
  let right = endNode;
  while (right) {
    if (left.val !== right.val) return false;
    left = left.next;
    right = right.next;
  }
  return true;
};

function findMiddleNode(head) {
  let slow = head, fast = head;
  while (fast.next && fast.next.next) {
    slow = slow.next;
    fast = fast.next.next;
  }
  return slow;
}

function reverseList(head) {
  let prev = null;
  let cur = head;
  while (cur) {
    let tmp = cur.next;
    cur.next = prev;
    prev = cur;
    cur = tmp;
  }
  return prev;
}
```

**`Double pointers with O(n) space`**
```javascript
var isPalindrome = function(head) {
  let nums = [];
  let node = head;
  while (node !== null) {
    nums.push(node.val);
    node = node.next;
  }
  return check(nums);
};

function check(arr) {
  let left = 0, right = arr.length - 1;
  while (left < right) {
    if (arr[left] !== arr[right]) return false;
    left++;
    right--;
  }
  return true;
}
```