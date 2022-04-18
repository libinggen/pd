# Hard

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
```


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
