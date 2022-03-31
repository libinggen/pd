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
