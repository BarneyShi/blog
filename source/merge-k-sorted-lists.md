---
title: Leetcode 23 - Merge k sorted lists
date: 2021-11-14 20:24:26
tags:
- linked list
---
**`Note:`**
- Merge each linked list one by one or every 2 together.

**`Question:`**

You are given an array of `k` `linked-lists` lists, each linked-list is sorted in ascending order.

Merge all the linked-lists into one sorted linked-list and return it.

**`Example:`**
```
Input: lists = [[1,4,5],[1,3,4],[2,6]]
Output: [1,1,2,3,4,4,5,6]
Explanation: The linked-lists are:
[
  1->4->5,
  1->3->4,
  2->6
]
merging them into one sorted list:
1->1->2->3->4->4->5->6
```

**`Code:`**

**`Divide and Conquer Merge O(NlogK)`**
- Explain: Based on binary saerch, there will be `logK` levels if we want to divide the whole list into single `node`.
- In every level, each `node` will be iterated `once`.
- `LogK` level, all `N` node will be `O(NlogK)`
```javascript
/**
 * Definition for singly-linked list.
 * function ListNode(val, next) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.next = (next===undefined ? null : next)
 * }
 */
/**
 * @param {ListNode[]} lists
 * @return {ListNode}
 */
 var mergeKLists = function(lists) {
  return merge(lists, 0, lists.length - 1);

  function merge(curlists, left, right) {
    if (left === right) return curlists[left];
    if (left > right) return null;
    const middle = (left + right) >> 1;
    return mergeTwoList(merge(curlists, left, middle), merge(curlists, middle + 1, right));
  }

  function mergeTwoList(head0, head1) {
    const dummyHead = new ListNode();
    let cur = dummyHead;
    while (head0 && head1) {
      if (head0.val < head1.val) {
        cur.next = head0;
        head0 = head0.next;
      } else {
        cur.next = head1;
        head1 = head1.next;
      }
      cur = cur.next;
    }
    cur.next = head0 ? head0 : head1;
    return dummyHead.next;
  }
};
```

**`Merge one by one O(NK)`**
- Explain why it's O(NK): Each linked list has `N/K` nexuses. From the left, each linked list will be iterated `k, k-1, k-2, ..., 3, 2, 1` times. It's `O(K^2)`.
- In total, it's `O(Nk)`.
```javascript
 var mergeKLists = function(lists) {
  if (lists.length === 0 || lists.length === 1 && lists[0] === null) return null;
  while (lists.length > 1) { 
    let head0 = lists[0];
    let head1 = lists[1];
    const dummyHead = new ListNode();
    let cur = dummyHead;
    while (head0 && head1) {
      if (head0.val < head1.val) {
        cur.next = head0;
        head0 = head0.next;
      } else {
        cur.next = head1;
        head1 = head1.next;
      }
      cur = cur.next;
    }
    cur.next = head0 ? head0 : head1;
    lists.shift();
    lists.shift();
    lists.unshift(dummyHead.next);
  }
  return lists[0];
};
```