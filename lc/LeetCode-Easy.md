# LeetCode

https://leetcode.com

## Java

```
整形类型，最大值Integer.MAX_VALUE 2147483647，最小值Integer.MIN_VALUE -2147483648。
越界
Integer.MAX_VALUE + 1 = Integer.MIN_VALUE
Math.abs(Integer.MIN_VALUE) = Integer.MIN_VALUE
```

## Easy

1. Two Sum
```
public int[] twoSum(int[] nums, int target) {
    Map<Integer,Integer> map = new HashMap<>();
    for(int i=0;i<nums.length;i++) {
        if(map.containsKey(target-nums[i])){return new int[]{map.get(target-nums[i]),i};}
        map.put(nums[i],i);
    }
    return new int[0];
}
```

53. Maximum Subarray
```
public int maxSubArray(int[] nums) {
    int c = nums[0];
    int m = nums[0];
    for (int i = 1; i < nums.length; i++) {
        int n = nums[i];
        c = Math.max(n, n + c);
        m = Math.max(m, c);
    }
    return m;
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
root of binary tree, invert tree, return its root.

Input: root = [4,2,7,1,3,6,9]
Output: [4,7,2,9,6,3,1]
```
```
二叉树根节点，翻转二叉树，返根节点
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

344. Reverse String 反转字符串

```
reverses string. string is array of characters s.
modifying input array in-place with O(1) extra memory.

Input: s = ["h","e","l","l","o"]
Output: ["o","l","l","e","h"]

```
```
字符串反转，字符数组，原地修改输入数组，O(1)额外空间
```
```

```
```

```

345. Reverse Vowels of a String

```
public String reverseVowels(String s) {
    char carr[] = s.toCharArray();
    String vs = "aeiouAEIOU";
    int left = 0, right = s.length()-1;
    while(left<right){
        while(left<right && !vs.contains(carr[left]+""))left++;
        while(left<right && !vs.contains(carr[right]+""))right--;
        char temp = carr[left];
        carr[left] = carr[right];
        carr[right] = temp;
        left++;
        right--;
    }
    return new String(carr);
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

543. Diameter of Binary Tree 二叉树直径

```
root of binary tree, length of diameter of tree.
length of longest path two nodes in tree.
number of edges.

Input: root = [1,2,3,4,5]
Output: 3
Explanation: 3 is the length of the path [4,2,1,3] or [5,2,1,3].
```
```
二叉树，直径长度，两结点路径长度最大值，边数
```
```
边0，递节，返边；
节空边0，递左，递右，边大边左右，返大左右1
```
```
private int diameter;
public int diameterOfBinaryTree(TreeNode root) {
    diameter = 0;
    longestPath(root);
    return diameter;
}
private int longestPath(TreeNode node){
    if(node == null) return 0;
    int leftPath = longestPath(node.left);
    int rightPath = longestPath(node.right);

    diameter = Math.max(diameter, leftPath + rightPath);
    return Math.max(leftPath, rightPath) + 1;
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
```DFS```
```
存始值，非新递始；
同始值，改新值，递上下左右；
```
```
public int[][] floodFill(int[][] image, int sr, int sc, int newColor) {
    int color = image[sr][sc];
    if (color != newColor) dfs(image, sr, sc, color, newColor);
    return image;
}
public void dfs(int[][] image, int r, int c, int color, int newColor) {
    if (image[r][c] == color) {
        image[r][c] = newColor;
        if (r >= 1) dfs(image, r-1, c, color, newColor);
        if (c >= 1) dfs(image, r, c-1, color, newColor);
        if (r+1 < image.length) dfs(image, r+1, c, color, newColor);
        if (c+1 < image[0].length) dfs(image, r, c+1, color, newColor);
    }
}
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

938. Range Sum of BST

```
root node of a binary search tree, sum of values of all nodes in the inclusive range

Input: root = [10,5,15,3,7,null,18], low = 7, high = 15
Output: 32
```
```
二叉搜索树根结点，范围结点和，BST 左<节<右
```
```深度优先 递左右 插底```

```
节空0，节高递左，节低递右，节递左右
```

```
public int rangeSumBST(TreeNode root, int low, int high) {
    if(root == null){return 0;};
    if(root.val > high){return rangeSumBST(root.left,low,high);};
    if(root.val < low){return rangeSumBST(root.right,low,high);};
    return root.val + rangeSumBST(root.left,low,high) + rangeSumBST(root.right,low,high);
}
```

```广度优先 加左右 横扫```

```
总0，建队，队加节，队非空；
队头节，节空过，节高加左，节低加右，总加节，队加左右；
返总
```

```
public int rangeSumBST(TreeNode root, int low, int high) {
    int sum = 0;
    Queue<TreeNode> q = new LinkedList<TreeNode>();
    q.offer(root);
    while (!q.isEmpty()){
        TreeNode node = q.poll();
        if(node == null){continue;};
        if(node.val > high){q.offer(node.left);}else
        if(node.val < low){q.offer(node.right);}else
        {sum += node.val;q.offer(node.left);q.offer(node.right);}
    }
    return sum;
}
```
