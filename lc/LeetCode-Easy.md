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
```DFS```
```
空返0，递左，递右，大左右加1
```
```
public int maxDepth(TreeNode root) {
    if (root == null) {return 0;} 
    else {
        int leftHeight = maxDepth(root.left);
        int rightHeight = maxDepth(root.right);
        return Math.max(leftHeight, rightHeight) + 1;
    }
}
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

```DFS```
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

```BFS```
```
1空返2，2空返1，队加12；
队非空，队弹12，1加2，12左非空队加12左，1左空2左，12右非空队加12右，1右空2右；
```
```
public TreeNode mergeTrees(TreeNode t1, TreeNode t2) {
	if(t1==null) {return t2;}
    if(t2==null) {return t1;}
	Queue<TreeNode> queue = new LinkedList<TreeNode>();
	queue.add(t1);
	queue.add(t2);
	while(!queue.isEmpty()) {
		TreeNode n1 = queue.poll();
		TreeNode n2 = queue.poll();
		n1.val += n2.val;
		if(n1.left!=null && n2.left!=null){queue.add(n1.left);queue.add(n2.left);}
		else if(n1.left==null) {n1.left = n2.left;}
		if(n1.right!=null && n2.right!=null) {queue.add(n1.right);queue.add(n2.right);}
		else if(n1.right==null) {r1.right = n2.right;}
	}
	return t1;
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

997. Find the Town Judge 找小镇法官

```
In town, n people labeled from 1 to n. one of people is town judge.
town judge trusts nobody.
Everybody (except for town judge) trusts town judge.
exactly one person that satisfies properties 1 and 2.
array trust where trust[i] = [ai, bi] representing person labeled ai trusts person labeled bi.
Return label of town judge if town judge exists and can be identified, or return -1 otherwise.

Input: n = 3, trust = [[1,3],[2,3]]
Output: 3
```
```
n人，从1到n。法官不信任任何人，除法官都信法官，只有一人满足前二项。数组，i、ai信bi。有返法官号，无返-1。
```
```
边不足返-1；
遍信，信0出度加，信1入度加；
遍入出度，入度N-1、出度0，法官；
返-1；
```
```
public int findJudge(int N, int[][] trust) {
    if (trust.length < N - 1) {return -1;}

    int[] indegrees = new int[N + 1];
    int[] outdegrees = new int[N + 1];

    for (int[] relation : trust) {
        outdegrees[relation[0]]++;
        indegrees[relation[1]]++; 
    }

    for (int i = 1; i <= N; i++) {
        if (indegrees[i] == N - 1 && outdegrees[i] == 0) {return i;}
    }
    return -1;
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