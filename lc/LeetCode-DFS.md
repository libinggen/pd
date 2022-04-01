# DFS

## Easy

101. Symmetric Tree 对称二叉树

```
二叉树根节点，轴对称
```
```
root of binary tree, check mirror of itself (symmetric around center).

Input: root = [1,2,2,3,4,4,3]
Output: true
```
```
递根根；
空且空真，空或空假，值等递左右
```
```
public boolean isSymmetric(TreeNode root) {
    return dfs(root, root);
}

public boolean dfs(TreeNode t1, TreeNode t2) {
    if (t1 == null && t2 == null) return true;
    if (t1 == null || t2 == null) return false;
    return (t1.val == t2.val)
        && dfs(t1.right, t2.left)
        && dfs(t1.left, t2.right);
}
```

226. Invert Binary Tree 翻转二叉树

```
二叉树根节点，翻转二叉树，返根节点
```
```
root of binary tree, invert tree, return its root.

Input: root = [4,2,7,1,3,6,9]
Output: [4,7,2,9,6,3,1]
```
```
递根；
节空返空，左递右，右递左，返节
```
```
public TreeNode invertTree(TreeNode root) {
    return dfs(root);
}
public TreeNode dfs(TreeNode node) {
    if (node == null) {return null;}
    TreeNode right = dfs(node.right);
    TreeNode left = dfs(node.left);
    node.left = right;
    node.right = left;
    return node;
}
```

463. Island Perimeter 岛屿周长

```
二维网格，1陆0水，格水平垂直相连，水包围，只一岛，岛无湖，格边1，网长方，宽高不过100，岛周长。
```
```
row x col grid map, grid[i][j] = 1 land, grid[i][j] = 0 water.

Grid cells connected horizontally/vertically (not diagonally). grid surrounded water, one island (one or more connected land cells).

island doesn't have "lakes", water inside isn't connected to water around island. One cell square with side length 1. grid rectangular, width and height don't exceed 100. Determine perimeter of island.

Input: grid = [[0,1,0,0],[1,1,1,0],[0,1,0,0],[1,1,0,0]]
Output: 16
```
```
遍行，遍列，岛递行列；
超界加，水加，标过0，标2，递上下左右
```
```
public int islandPerimeter(int[][] grid) {
    for (int r = 0; r < grid.length; r++) {
        for (int c = 0; c < grid[0].length; c++) {
            if (grid[r][c] == 1) {return dfs(grid, r, c);}
        }
    }
    return 0;
}

int dfs(int[][] grid, int r, int c) {
    if (!(0 <= r && r < grid.length && 0 <= c && c < grid[0].length)) {return 1;}
    if (grid[r][c] == 0) {return 1;}
    if (grid[r][c] != 1) {return 0;}
    grid[r][c] = 2;
    return dfs(grid, r - 1, c)
        + dfs(grid, r + 1, c)
        + dfs(grid, r, c - 1)
        + dfs(grid, r, c + 1);
}
```

## Medium



## Hard

987. Vertical Order Traversal of a Binary Tree

```
二叉树根结点，计算二叉树垂序遍历序列，结点(r,c)、左子(r+1,c-1)、右子(r+1,c-1)、根结点(0,0)，从左到右按列遍历，出现位置从上到下从小到大的有序列表
```
```
节组，递根00，节序比不等列行值；
答组，大小0，空前列，遍节；
  列行值，后列前列加组大小加1，等加值；
返答组；
空返，加节组，递左后行前列节组，递右后行后列节组
```
```
root of binary tree, calculate vertical order traversal of binary tree.
each node at position (row, col), its left and right children (row + 1, col - 1) and (row + 1, col + 1). root of tree at (0, 0).
vertical order traversal of binary tree is list of top-to-bottom orderings for each column index starting from leftmost column and ending on rightmost column. sort nodes by value.
Return vertical order traversal of the binary tree.

Input: root = [1,2,3,4,5,6,7]
Output: [[4],[2],[1,5,6],[3],[7]]
Explanation:
Column -2: Only node 4 is in this column.
Column -1: Only node 2 is in this column.
Column 0: Nodes 1, 5, and 6 are in this column.
          1 is at the top, so it comes first.
          5 and 6 are at the same position (2, 0), so we order them by their value, 5 before 6.
Column 1: Only node 3 is in this column.
Column 2: Only node 7 is in this column.
```
```
public List<List<Integer>> verticalTraversal(TreeNode root) {
    List<int[]> nodes = new ArrayList<int[]>();
    dfs(root, 0, 0, nodes);
    Collections.sort(nodes, new Comparator<int[]>() {
        public int compare(int[] tuple1, int[] tuple2) {
            if (tuple1[0] != tuple2[0]) {return tuple1[0] - tuple2[0];} 
            else if (tuple1[1] != tuple2[1]) {return tuple1[1] - tuple2[1];} 
            else {return tuple1[2] - tuple2[2];}
        }
    });
    List<List<Integer>> ans = new ArrayList<List<Integer>>();
    int size = 0;
    int lastcol = Integer.MIN_VALUE;
    for (int[] tuple : nodes) {
        int col = tuple[0], row = tuple[1], value = tuple[2];
        if (col != lastcol) {lastcol = col;ans.add(new ArrayList<Integer>());size++;}
        ans.get(size - 1).add(value);
    }
    return ans;
}

public void dfs(TreeNode node, int row, int col, List<int[]> nodes) {
    if (node == null) {return;}
    nodes.add(new int[]{col, row, node.val});
    dfs(node.left, row + 1, col - 1, nodes);
    dfs(node.right, row + 1, col + 1, nodes);
}
```
