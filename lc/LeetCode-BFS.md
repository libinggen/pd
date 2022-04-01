# BFS

## Easy

733. Flood Fill 图像渲染

```
m x n integer grid image, image[i][j] represents pixel value of image.
three integers sr, sc, and newColor. perform flood fill on image starting from pixel image[sr][sc].
consider starting pixel, plus any pixels connected 4-directionally to starting pixel of the same color as starting pixel, plus any pixels connected 4-directionally to those pixels with same color. Replace color of all of aforementioned pixels with newColor.
Return modified image flood fill.

Input: image = [[1,1,1],[1,1,0],[1,0,1]], sr = 1, sc = 1, newColor = 2
Output: [[2,2,2],[2,2,0],[2,0,1]]
Explanation: From the center of the image with position (sr, sc) = (1, 1) (i.e., the red pixel), all pixels connected by a path of the same color as the starting pixel (i.e., the blue pixels) are colored with the new color.
Note the bottom corner is not colored 2, because it is not 4-directionally connected to the starting pixel.
```
```
二维网格图，image[i][j]像素值颜色，始点sr、sc，新色newColor，始点上下左右同值点改为newColor。
```
```BFS```
```
存始值，同新返，长宽、队加始点，始更值，队非空；
弹点，横纵，遍四方；
上下左右，界内、队加点、点更值；
```
```
int[] dx = {1, 0, 0, -1};
int[] dy = {0, 1, -1, 0};

public int[][] floodFill(int[][] image, int sr, int sc, int newColor) {
    int currColor = image[sr][sc];
    if (currColor == newColor) {return image;}
    int n = image.length, m = image[0].length;
    Queue<int[]> queue = new LinkedList<int[]>();
    queue.offer(new int[]{sr, sc});
    image[sr][sc] = newColor;
    while (!queue.isEmpty()) {
        int[] cell = queue.poll();
        int x = cell[0], y = cell[1];
        for (int i = 0; i < 4; i++) {
            int mx = x + dx[i], my = y + dy[i];
            if (mx >= 0 && mx < n && my >= 0 && my < m && image[mx][my] == currColor) {queue.offer(new int[]{mx, my});image[mx][my] = newColor;}
        }
    }
    return image;
}
```


## Medium


## Hard