# DFS

## Easy

94. Binary Tree Inorder Traversal 二叉树中序遍历

```
root of binary tree, return inorder traversal of nodes' values.

Input: root = [1,null,2,3]
Output: [1,3,2]
```
```
二叉树根节点，中序遍历。左节右。
```

```DFS```
```
递根；
节空返，递左，加节值，递右；
```
```
public List<Integer> inorderTraversal(TreeNode root) {
    List<Integer> res = new ArrayList<>();
    dfs(root, res);
    return res;
}

public void dfs(TreeNode node, List<Integer> res) {
    if (node == null) return;
    dfs(node.left, res);
    res.add(node.val);
    dfs(node.right, res);
}
```

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

```DFS```
```
空且空真，空或空假，返递左且递右
```
```
public boolean isSameTree(TreeNode p, TreeNode q) {
    return dfs(p, q);
}

public boolean dfs(TreeNode p, TreeNode q) {
    if (p == null && q == null) {return true;}
    else if (p == null || q == null) {return false;}
    else if (p.val != q.val) {return false;}
    else {return dfs(p.left, q.left) && dfs(p.right, q.right);}
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

```DFS```
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
```DFS```
```
空返0，递左，递右，大左右加1
```
```
public int maxDepth(TreeNode root) {
    if (root == null) {
        return 0;
    } else {
        int leftHeight = maxDepth(root.left);
        int rightHeight = maxDepth(root.right);
        return Math.max(leftHeight, rightHeight) + 1;
    }
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
节空返空，左递右，右递左，左右换，返节；
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

235. Lowest Common Ancestor of a Binary Search Tree 二叉搜索树的最近公共祖先

```
binary search tree (BST), find lowest common ancestor (LCA) of two nodes in BST.

According to definition of LCA on Wikipedia: “lowest common ancestor is defined between two nodes p and q as lowest node in T that has both p and q as descendants (node to be a descendant of itself).”

Input: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 8
Output: 6
Explanation: The LCA of nodes 2 and 8 is 6.
```
```
二叉搜索树，两个节点最近公共祖先。最近公共祖先，两节点都是子节点的最近点。
```

```DFS```
```
节值大返递左，节值小返递右，返节
```
```
public TreeNode lowestCommonAncestor(TreeNode root, TreeNode p, TreeNode q) {
    return dfs(root, p.val, q.val);
}

public TreeNode dfs(TreeNode node, int pVal, int qVal) {
    int nodeVal = node.val;
    if (pVal < nodeVal && qVal < nodeVal) {return dfs(node.left, pVal, qVal);}
    if (pVal > nodeVal && qVal > nodeVal) {return dfs(node.right, pVal, qVal);}
    return node;
}
```

270. Closest Binary Search Tree Value 最接近的二叉搜索树值

```
root of binary search tree and target value, return value in BST that is closest to target.

Input: root = [4,2,5,1,3], target = 3.714286
Output: 4
```
```
二叉搜索树，目标值，返回最接近目标的二叉搜索树值。
```

```DFS```
```
节空返值，节近节值，节小递右，节大递左
```
```
public int closestValue(TreeNode root, double target) {
    return dfs(root, target, root.val);
}
    
private int dfs(TreeNode node, double target, int val) {
    if (node == null) return val;
    if (Math.abs(node.val - target) < Math.abs(val - target)) val = node.val;
    if (node.val < target) val = dfs(node.right, target, val);
    else if (node.val > target) val = dfs(node.left, target, val);
    return val;
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

```DFS```
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

617. Merge Two Binary Trees 合并二叉树

```
two binary trees root1 and root2.
put one of them to cover other, some nodes of two trees are overlapped while others are not. merge two trees into a new binary tree. merge rule is if two nodes overlap, then sum node values up as new value of merged node. Otherwise, NOT null node will be used as node of new tree.
Return merged tree.
merging process must start from the root nodes of both trees.

Input: root1 = [1,3,2,5], root2 = [2,1,3,null,4,null,7]
Output: [3,4,5,5,4,null,7]
```
```
两二叉树，合并新树，节点重叠，值相加，不空新节，返回新树。合并从根开始。
```
```DFS```
```
1空返2，2空返1，1值加2值；
1左递左左，1右递右右，返1；
```
```
public TreeNode mergeTrees(TreeNode t1, TreeNode t2) {
    return dfs(t1, t2);
}n2
public TreeNode dfs(TreeNode n1, TreeNode n2) {
    if (n1 == null)return n2;
    if (n2 == null)return n1;
    n1.val += n2.val;
    n1.left = dfs(n1.left, n2.left);
    n1.right = dfs(n1.right, n2.right);
    return n1;
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

1022. Sum of Root To Leaf Binary Numbers 从根到叶的二进制数和

```
root of binary tree where each node has value 0 or 1. Each root-to-leaf path represents binary number starting with most significant bit.
path is 0 -> 1 -> 1 -> 0 -> 1, represent 01101 in binary, which is 13.
all leaves in the tree, consider numbers represented by path from root to leaf. Return sum of numbers.
answer fits in 32-bits integer.

Input: root = [1,0,1,0,1,0,1]
Output: 22
Explanation: (100) + (101) + (110) + (111) = 4 + 5 + 6 + 7 = 22
```
```
二叉树，结点值0或1，从根到叶路径代表从最高有效位开始二进数，每叶根路径数字，返回和。32位整数。
```

```DFS```
```
递根0；
节空返0，值2加节值，左等右返值，返递左值加递右值；
```
```
public int sumRootToLeaf(TreeNode root) {
    return dfs(root, 0);
}

public int dfs(TreeNode node, int val) {
    if (node == null) return 0;
    val = val * 2 + node.val;
    if (node.left == node.right) return val;
    return dfs(node.left, val) + dfs(node.right, val);
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
