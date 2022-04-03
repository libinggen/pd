# BFS

## Easy

104. Maximum Depth of Binary Tree 二叉树最大深度

```
root of binary tree, return maximum depth.
binary tree's maximum depth is number of nodes along longest path from root node down to farthest leaf node.

Input: root = [3,9,20,null,null,15,7]
Output: 3
```
```
二叉树根节点，找最大深度。二叉树深度为根节点到最远叶子节点的最长路径节点数。叶子节点是没有子节点。
```
```BFS```
```
空返0，队加根，深0，队非空；
队长大0，弹节，左右非空加队，队长减1；
深加1，返深；
```
```
public int maxDepth(TreeNode root) {
    if (root == null) {return 0;}
    Queue<TreeNode> queue = new LinkedList<TreeNode>();
    queue.offer(root);
    int ans = 0;
    while (!queue.isEmpty()) {
        int size = queue.size();
        while (size > 0) {
            TreeNode node = queue.poll();
            if (node.left != null) {queue.offer(node.left);}
            if (node.right != null) {queue.offer(node.right);}
            size--;
        }
        ans++;
    }
    return ans;
}

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

815. Bus Routes 公交路线

```
array bus routes where routes[i] is bus route ith bus repeats forever.
routes[0] = [1, 5, 7], 0th bus travels in sequence 1 -> 5 -> 7 -> 1 forever.
start at bus stop source (not on any bus initially), go to bus stop target. travel between bus stops by buses only.
Return least number of buses take to travel from source to target. Return -1 if not possible.

Input: routes = [[1,2,7],[3,6,7]], source = 1, target = 6
Output: 2
Explanation: The best strategy is take the first bus to the bus stop 7, then take the second bus to the bus stop 6.
```
```
数组系列公交路线，每个元素一条公交路线，公交循环行驶。从始站到终站，只可乘公交。最少公交车数量，不可达终站返-1。
```
```BFS```
```
始终返0，路数，路边二维组，站路表，遍路，遍站，站路组，组加路，表加站路，乘组全-1，队，乘始点1，队加始点路；
队非空，队弹路，遍路，始连路未乘连路加1，队加连路；
乘大数，终点路，乘过小乘，有乘数无-1；
```
```
public int numBusesToDestination(int[][] routes, int source, int target) {
    if (source == target) {return 0;}

    int n = routes.length;
    boolean[][] edge = new boolean[n][n];
    Map<Integer, List<Integer>> rec = new HashMap<Integer, List<Integer>>();
    for (int i = 0; i < n; i++) {
        for (int site : routes[i]) {
            List<Integer> list = rec.getOrDefault(site, new ArrayList<Integer>());
            for (int j : list) {
                 edge[i][j] = edge[j][i] = true;
            }
            list.add(i);
            rec.put(site, list);
        }
    }

    int[] dis = new int[n];
    Arrays.fill(dis, -1);
    Queue<Integer> que = new LinkedList<Integer>();
    for (int bus : rec.getOrDefault(source, new ArrayList<Integer>())) {
        dis[bus] = 1;
        que.offer(bus);
    }
    while (!que.isEmpty()) {
        int x = que.poll();
        for (int y = 0; y < n; y++) {
            if (edge[x][y] && dis[y] == -1) {dis[y] = dis[x] + 1;que.offer(y);}
        }
    }

    int ret = Integer.MAX_VALUE;
    for (int bus : rec.getOrDefault(target, new ArrayList<Integer>())) {
        if (dis[bus] != -1) {ret = Math.min(ret, dis[bus]);}
    }
    return ret == Integer.MAX_VALUE ? -1 : ret;
}