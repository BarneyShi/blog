---
title: Leetcode 147 - Insertion sort list
date: 2021-11-29 02:24:59
tags:
- linked list
- double pointers
---
**`Note:`**
- ![img](https://i.imgur.com/0YGhZpv.png)
- Add a `dummy` to the head in case we need to move the first node. And also we can quickly return the `new head`.
- Use `curr` to iterate the whole list.
- Use `tmp` to find `tmp.next.val < curr.val` until `tmp.next == null`.
- Only `curr = curr.next` if no node is smaller than curr.
- Cut off the node from the list.
- Start from `dummy`, to find the insertion position with `findInsertion.next.val > nodeToBeInserted.val`.

**`Question:`**

Given the `head` of a singly linked list, sort the list using `insertion sort`, and return the sorted list's head.

The steps of the `insertion sort` algorithm:

1. Insertion sort iterates, consuming one input element each repetition and growing a sorted output list.
2. At each iteration, insertion sort removes one element from the input data, finds the location it belongs within the sorted list and inserts it there.
3. It repeats until no input elements remain.

The following is a graphical example of the insertion sort algorithm. The partially sorted list (black) initially contains only the first element in the list. One element (red) is removed from the input data and inserted in-place into the sorted list with each iteration.
![img](https://upload.wikimedia.org/wikipedia/commons/0/0f/Insertion-sort-example-300px.gif)

**`Example:`**
![img](https://assets.leetcode.com/uploads/2021/03/04/sort1linked-list.jpg)
```
Input: head = [4,2,1,3]
Output: [1,2,3,4]
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
var insertionSortList = function(head) {
  const dummyHead = new ListNode();
  dummyHead.next = head;
  let curr = head;
  while (curr) {
    let tmp = curr;
    // Has to be `tmp.next` so we can cut off the next node.
    while (tmp.next && curr.val < tmp.next.val) {
      tmp = tmp.next;
    }
    if (tmp.next === null) {
      curr = curr.next;
      continue;
    }
    // Cut off the node
    let nodeToBeInserted = tmp.next;
    tmp.next = tmp.next.next;
    nodeToBeInserted.next = null;
    // Find insertion position
    let findInsertionPosition = dummyHead;
    while (findInsertionPosition.next && findInsertionPosition.next.val < nodeToBeInserted.val) {
      findInsertionPosition = findInsertionPosition.next;
    } 
    // Insert the node
    tmp = findInsertionPosition.next;
    findInsertionPosition.next = nodeToBeInserted;
    nodeToBeInserted.next = tmp;
  }
  return dummyHead.next;
};
```

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
var insertionSortList = function(head) {
  const dummyHead = new ListNode();
  dummyHead.next = head;
  let arr = [];
  let p = dummyHead;
  while (p) {
    arr.push(p);
    p = p.next;
  }
  arr = insertionSort(arr);
  return arr[1];

  function insertionSort(array) {
    for (let i = 1; i < array.length; i++) {
      let j = i - 1;
      while (j >= 1 && array[j + 1].val < array[j].val) {
        let tmp = arr[j + 1].next;
        arr[j - 1].next = arr[j + 1];
        arr[j].next = tmp;
        arr[j + 1].next = arr[j];
        [arr[j], arr[j + 1]] = [arr[j + 1], arr[j]];
        j--;
      }
    }
    return array;
  }
};
```