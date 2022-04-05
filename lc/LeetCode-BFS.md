# BFS

## Easy

100. Same Tree 相同树

```
roots of two binary trees p and q, they are the same or not.
structurally identical, and nodes have same value.

Input: p = [1,2], q = [1,null,2]
Output: false
```
```
两棵二叉树根节点，检验是否相同。结构相同，节点同值。
```

```BFS```
```
空且空真，空或空假，队加节；
队非空，队弹节，不同值假，左右不同空假，加左右；
空且空真
```
```
public boolean isSameTree(TreeNode p, TreeNode q) {
    if (p == null && q == null) {return true;}
    else if (p == null || q == null) {return false;}

    Queue<TreeNode> queP = new LinkedList<TreeNode>();
    Queue<TreeNode> queQ = new LinkedList<TreeNode>();
    queP.offer(p);
    queQ.offer(q);

    while (!queP.isEmpty() && !queQ.isEmpty()) {
        TreeNode nodeP = queP.poll();
        TreeNode nodeQ = queQ.poll();
        if (nodeP.val != nodeQ.val) {return false;}

        TreeNode leftP = nodeP.left, rightP = nodeP.right;
        TreeNode leftQ = nodeQ.left, rightQ = nodeQ.right;
        if (leftP == null ^ leftQ == null) {return false;}
        if (rightP == null ^ rightQ == null) {return false;}
        if (leftP != null) {queP.offer(leftP);}
        if (rightP != null) {queP.offer(rightP);}
        if (leftQ != null) {queQ.offer(leftQ);}
        if (rightQ != null) {queQ.offer(rightQ);}
    }
    return queP.isEmpty() && queQ.isEmpty();
}
```

101. Symmetric Tree 对称二叉树

```
root of binary tree, check mirror of itself (symmetric around center).

Input: root = [1,2,2,3,4,4,3]
Output: true
```
```
二叉树根节点，轴对称
```

```BFS```
```
队加左右，队非空；
队弹左右，空且空过，空或空、值不等假，队加左右、队加右左；
返真；
```
```
public boolean isSymmetric(TreeNode root) {
    return bfs(root, root);
}

public boolean bfs(TreeNode u, TreeNode v) {
    Queue<TreeNode> q = new LinkedList<TreeNode>();
    q.offer(u);
    q.offer(v);
    while (!q.isEmpty()) {
        u = q.poll();
        v = q.poll();
        if (u == null && v == null) {continue;}
        if ((u == null || v == null) || (u.val != v.val)) {return false;}

        q.offer(u.left);
        q.offer(v.right);

        q.offer(u.right);
        q.offer(v.left);
    }
    return true;
}
```

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
```

226. Invert Binary Tree 翻转二叉树

```
root of binary tree, invert tree, return its root.

Input: root = [4,2,7,1,3,6,9]
Output: [4,7,2,9,6,3,1]
```
```
二叉树根节点，翻转二叉树，返根节点
```

```BFS```
```
根空返，队加根，队非空；
队弹节，左右换，非空队加左右；
```
```
public TreeNode invertTree(TreeNode root) {
    if (root == null) return null;
    Queue<TreeNode> queue = new LinkedList<TreeNode>();
    queue.add(root);
    while (!queue.isEmpty()) {
        TreeNode current = queue.poll();
        TreeNode temp = current.left;
        current.left = current.right;
        current.right = temp;
        if (current.left != null) queue.add(current.left);
        if (current.right != null) queue.add(current.right);
    }
    return root;
}
```

463. Island Perimeter 岛屿周长

```
row x col grid map, grid[i][j] = 1 land, grid[i][j] = 0 water.

Grid cells connected horizontally/vertically (not diagonally). grid surrounded water, one island (one or more connected land cells).

island doesn't have "lakes", water inside isn't connected to water around island. One cell square with side length 1. grid rectangular, width and height don't exceed 100. Determine perimeter of island.

Input: grid = [[0,1,0,0],[1,1,1,0],[0,1,0,0],[1,1,0,0]]
Output: 16
```
```
二维网格，1陆0水，格水平垂直相连，水包围，只一岛，岛无湖，格边1，网长方，宽高不过100，岛周长。
```

```BFS```
```
遍行，遍列，岛；
上右下左，超界、水加，加总，返总；
```
```
static int[] dx = {0, 1, 0, -1};
static int[] dy = {1, 0, -1, 0};

public int islandPerimeter(int[][] grid) {
    int n = grid.length, m = grid[0].length;
    int ans = 0;
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < m; ++j) {
            if (grid[i][j] == 1) {
                int cnt = 0;
                for (int k = 0; k < 4; ++k) {
                    int tx = i + dx[k];
                    int ty = j + dy[k];
                    if (tx < 0 || tx >= n || ty < 0 || ty >= m || grid[tx][ty] == 0) {
                        cnt += 1;
                    }
                }
                ans += cnt;
            }
        }
    }
    return ans;
}
```

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