---
title: Hackrank - 2D-array
date: 2021-08-18 22:58:28
tags:
- hackerrank
- array
---
**Thought:** 

   - Had to understand how to iterate a 2D array. Shame on me that I don't know this before. So, basically 2D array is like `arr = [[1,0,1], [2,1,2], [2,1,3]]`. So, its `rows = arr.length` and `cols = arr[0].length`.
   - Another thing is to determine the condition of `forloop`. Use `i+2 < rows` and `j+2 < cols`.

   

   **Example**

   ```
   -9 -9 -9  1 1 1 
    0 -9  0  4 3 2
   -9 -9 -9  1 2 3
    0  0  8  6 6 0
    0  0  0 -2 0 0
    0  0  1  2 4 0
   ```

   The hourglass sums are:

   ```
   -63, -34, -9, 12, 
   -10,   0, 28, 23, 
   -27, -11, -2, 10, 
     9,  17, 25, 18
   ```

   The highest hourglass sum is from the hourglass beginning at row , column :

   ```
   0 4 3
     1
   8 6 6
   ```

   ```javascript
   // Complete the hourglassSum function below.
   function hourglassSum(arr) {
     const columns = arr[0].length;
     const rows = arr.length;
     // arr[i][j] arr[i][j+1]  arr[i][j+2]
     //           arr[i+1][j+1]
     //  arr[i+2][j]arr[i+2][j+1]arr[i+2][j+2] 
     let cur_min = Number.NEGATIVE_INFINITY;
     for (let i = 0; i + 2 < rows; i++) {
       for (let j = 0; j + 2 < columns; j++) {
         let temp_sum = arr[i][j] + arr[i][j + 1] + arr[i][j + 2] + arr[i + 1][j + 1] + arr[i + 2][j] + arr[i + 2][j + 1] + arr[i + 2][j + 2];
         cur_min = Math.max(cur_min, temp_sum);
       }
     }
     return cur_min;
   }
   ```
