---
title: Leetcode 355 - Design twitter
date: 2021-12-06 20:06:13
tags:
- linked list
- hash table
---
**`Note:`**
- Not a real hard problem if you just use `map` and `sort`. But don't do Leetcode just for doing it. The optimal way is to use `OOP` and create `Tweet` & `User` class.
- `User {userId, followees, tweets}`.
- `Tweet {userId, tweetId, time, next}`. Tweets should `linked list` node. In this way, we can quickly `merge the first 10` nodes without wasting time.
- `Twitter {time}`. Starts with `0`, every time we create a new post, `increment time by 1`.
- While merging `10` tweets, don't make changes to the original `nodes`. We need to keep their original order. 

**`Question:`**

Design a simplified version of Twitter where users can post tweets, follow/unfollow another user, and is able to see the `10` most recent tweets in the user's news feed.

Implement the `Twitter` class:

- `Twitter()` Initializes your twitter object.
- `void postTweet(int userId, int tweetId)` Composes a new tweet with ID `tweetId` by the user userId. Each call to this function will be made with a unique `tweetId`.
- `List<Integer> getNewsFeed(int userId)` Retrieves the `10` most recent tweet IDs in the user's news feed. Each item in the news feed must be posted by users who the user followed or by the user themself. Tweets must be ordered from most recent to least recent.
- `void follow(int followerId, int followeeId)` The user with ID `followerId` started following the user with ID `followeeId`.
- `void unfollow(int followerId, int followeeId)` The user with ID `followerId` started unfollowing the user with ID `followeeId`.

**`Example:`**
```
Input
["Twitter", "postTweet", "getNewsFeed", "follow", "postTweet", "getNewsFeed", "unfollow", "getNewsFeed"]
[[], [1, 5], [1], [1, 2], [2, 6], [1], [1, 2], [1]]
Output
[null, null, [5], null, null, [6, 5], null, [5]]

Explanation
Twitter twitter = new Twitter();
twitter.postTweet(1, 5); // User 1 posts a new tweet (id = 5).
twitter.getNewsFeed(1);  // User 1's news feed should return a list with 1 tweet id -> [5]. return [5]
twitter.follow(1, 2);    // User 1 follows user 2.
twitter.postTweet(2, 6); // User 2 posts a new tweet (id = 6).
twitter.getNewsFeed(1);  // User 1's news feed should return a list with 2 tweet ids -> [6, 5]. Tweet id 6 should precede tweet id 5 because it is posted after tweet id 5.
twitter.unfollow(1, 2);  // User 1 unfollows user 2.
twitter.getNewsFeed(1);  // User 1's news feed should return a list with 1 tweet id -> [5], since user 1 is no longer following user 2.
```

**`Code:`**
```javascript
const MAX_TWEETS = 10;

var Twitter = function() {
  this.time = 0;
  this.userMap = new Map();
};

var Tweet = function (userId = null, tweetId = null, time = 0, next = null) {
  this.userId = userId;
  this.tweetId = tweetId;
  this.time = time;
  this.next = next;
}

var User = function (userId = null) {
  this.userId = userId;
  this.followees = new Set([userId]);
  this.tweets = null;
}

/** 
 * @param {number} userId 
 * @param {number} tweetId
 * @return {void}
 */
Twitter.prototype.postTweet = function(userId, tweetId) {
  const timestamp = this.time;
  this.time++;
  let user = this.userMap.get(userId);
  if (!user) {
    user = new User(userId);
    this.userMap.set(userId, user);
  }
  const newTweet = new Tweet(userId, tweetId, timestamp);
  this.appendTweet(user, newTweet);
};

/** 
 * @param {number} userId
 * @return {number[]}
 */
Twitter.prototype.getNewsFeed = function(userId) {
  if (!this.userMap.has(userId)) {
    const user = new User(userId);
    this.userMap.set(userId, user);
  }
  const kTweetLists = [];
  let followees = Array.from(this.userMap.get(userId).followees);
  for (let i = 0; i < followees.length; i++) {
    if (!this.userMap.get(followees[i])) continue;
    const tweets = this.userMap.get(followees[i]).tweets
    tweets && kTweetLists.push(tweets);
  }

  const merged = this.mergeKLists(kTweetLists, 0, kTweetLists.length - 1);
  let p = merged;
  let res = [];
  for (let i = 0; p && i < 10; i++) {
    res.push(p.tweetId);
    p = p.next;
  }
  return res;
};

/** 
 * @param {number} followerId 
 * @param {number} followeeId
 * @return {void}
 */
Twitter.prototype.follow = function(followerId, followeeId) {
  if (!this.userMap.has(followerId)) {
    const user = new User(followerId);
    this.userMap.set(followerId, user);
  }
  this.userMap.get(followerId).followees.add(followeeId);
};

/** 
 * @param {number} followerId 
 * @param {number} followeeId
 * @return {void}
 */
Twitter.prototype.unfollow = function(followerId, followeeId) {
  if (!this.userMap.has(followerId)) {
    const user = new User(followerId);
    this.userMap.set(followerId, user);
  }
  this.userMap.get(followerId).followees.delete(followeeId);
};

Twitter.prototype.appendTweet = function (user, tweet) {
  const tweets = user.tweets;
  if (tweets === null) {
    user.tweets = tweet;
    return; 
  }
  let tmp = tweets;
  user.tweets = tweet;
  tweet.next = tmp;
}

Twitter.prototype.mergeKLists = function (lists, left, right) {
  if (left === right) return lists[left];
  if (left > right) return null;
  const mid = (left + right) >> 1;
  return merge(this.mergeKLists(lists, left, mid), this.mergeKLists(lists, mid + 1, right));

  function merge(list1, list2) {
    let count = 0;
    let dummy = new Tweet();
    let p1 = list1, p2 = list2;
    let tmp = dummy;
    while (p1 && p2) {
      if (p1.time > p2.time) {
        const next = new Tweet(p1.userId, p1.tweetId, p1.time);
        p1 = p1.next;
        tmp.next = next;
        count++;
      } else {
        const next = new Tweet(p2.userId, p2.tweetId, p2.time);
        p2 = p2.next;
        tmp.next = next;
        count++;
      }
      if (count === MAX_TWEETS) return dummy.next;
      tmp = tmp.next;
    }
    while (p1) {
      tmp.next = p1;
      p1 = p1.next;
      tmp = tmp.next;
      count++;
      if (count === MAX_TWEETS) return dummy.next;
    }
    while (p2) {
      tmp.next = p2;
      p2 = p2.next;
      tmp = tmp.next;
      count++;
      if (count === MAX_TWEETS) return dummy.next;
    }
    return dummy.next;
  }
}

/**
 * Your Twitter object will be instantiated and called as such:
 * var obj = new Twitter()
 * obj.postTweet(userId,tweetId)
 * var param_2 = obj.getNewsFeed(userId)
 * obj.follow(followerId,followeeId)
 * obj.unfollow(followerId,followeeId)
 */

```