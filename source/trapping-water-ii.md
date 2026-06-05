---
title: Leetcode 407 - Trapping water II
date: 2021-11-02 23:35:18
tags:
- heap
- priority queue
---
**`Note:`**
- How many water can a tile contains depend on `max(itself, shortest neighbor)`.
- Start from the outermost tile. Put them one by one in a `Min-heap priority queue`, and mark them `true` in `visited[]`.
- Each time pop the `shortest pillar` from PQ, and check all its `neighbors`.
- If it's higher than some of its neighbors
  - Fill the neighbor up.
  - Put them in the PQ.
  - Mark as `visited`
  - `res = curHeight - neighbor's height`.
- Terminate when the queue is empty.

**`Question:`**

Given an m x n integer matrix heightMap representing the height of each unit cell in a 2D elevation map, return the volume of water it can trap after raining.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2021/04/08/trap1-3d.jpg)
```
Input: heightMap = [[1,4,3,1,3,2],[3,2,1,3,2,4],[2,3,3,2,3,1]]
Output: 4
Explanation: After the rain, water is trapped between the blocks.
We have two small pounds 1 and 3 units trapped.
The total volume of water trapped is 4.
```

**`Code:`**
```java
class Solution {
    public int trapRainWater(int[][] heightMap) {
      if (heightMap.length < 3 || heightMap[0].length < 3) return 0;
      int rows = heightMap.length;
      int cols = heightMap[0].length;
      boolean [][] visited = new boolean[rows][cols];
      // Create a min-heap PQ.
      PriorityQueue<int[]> pq = new PriorityQueue<>((o1, o2) -> o1[2] - o2[2]);

      for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) {
          if (i == 0 || i == rows - 1 || j == 0 || j == cols - 1) {
            visited[i][j] = true;
            pq.offer(new int[]{i, j, heightMap[i][j]});
          }
        }
      }
      int res = 0;
      // Use this direction array to quickly get 4 directions. 
      int[] dirs = {-1, 0, 1, 0, -1};
      while (!pq.isEmpty()) {
        int[] poll = pq.poll();
        for (int k = 0; k < 4; k++) {
          int nx = poll[0] + dirs[k];
          int ny = poll[1] + dirs[k + 1];
          if (nx >= 0 && nx < rows && ny >= 0 && ny < cols && !visited[nx][ny]) {
            if (poll[2] > heightMap[nx][ny]) {
              res += poll[2] - heightMap[nx][ny];
            }
            pq.offer(new int[]{nx, ny, Math.max(heightMap[nx][ny], poll[2])});
            visited[nx][ny] = true;
          }
        }
      }
      return res;
    }
}
```