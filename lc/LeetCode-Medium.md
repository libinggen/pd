## Medium

15. 3Sum
```
public List<List<Integer>> threeSum(int[] nums) {
    Arrays.sort(nums);
    List<List<Integer>> res=new ArrayList<>();
    for(int i = 0;i<nums.length-2&&nums[i]<=0;++i){
        if(i==0||nums[i-1]!=nums[i]){
            int lo = i+1, hi=nums.length-1;
            while(lo<hi){
                int sum=nums[i]+nums[lo]+nums[hi];
                if(sum==0){res.add(Arrays.asList(nums[i],nums[lo++],nums[hi--]));while(lo<hi&&nums[lo] == nums[lo-1]){++lo;}
                }else if(sum<0){++lo;
                }else {--hi;}
            }
        }
    }
    return res;
}
```

167. Two Sum II - Input Array Is Sorted
```
public int[] twoSum(int[] numbers, int target) {
    int l = 0, r = numbers.length-1;
    while(l < r){
        int sum = numbers[l] + numbers[r];
        if(sum == target)return new int[]{l+1, r+1};
        else if(sum < target){++l;}
        else{--r;}
    }
    return null;
}
```

200. Number of Islands 岛屿数量

```
二维网格，1陆地、0水，岛屿数量。陆地只能水平或垂直连接。网格四边水。
```

```
m x n 2D binary grid '1's (land) and '0's (water), number of islands.

An island is surrounded by water connecting adjacent lands horizontally or vertically. assume all four edges of the grid are all surrounded by water.

Input: grid = [
  ["1","1","0","0","0"],
  ["1","1","0","0","0"],
  ["0","0","1","0","0"],
  ["0","0","0","1","1"]
]
Output: 3
```
```
空返，行数，列数，岛0，遍行，遍列，格1，岛加1，递格；
行数，列数，空0返，标记，递左右上下
```
```
public int numIslands(char[][] grid) {
    if (grid == null || grid.length == 0) {
        return 0;
    }

    int nr = grid.length;
    int nc = grid[0].length;
    int num_islands = 0;
    for (int r = 0; r < nr; ++r) {
        for (int c = 0; c < nc; ++c) {
            if (grid[r][c] == '1') {++num_islands;dfs(grid, r, c);}
        }
    }

    return num_islands;
  }
  
private void dfs(char[][] grid, int r, int c) {
    int nr = grid.length;
    int nc = grid[0].length;

    if (r < 0 || c < 0 || r >= nr || c >= nc || grid[r][c] == '0') {return;}

    grid[r][c] = '0';
    dfs(grid, r - 1, c);
    dfs(grid, r + 1, c);
    dfs(grid, r, c - 1);
    dfs(grid, r, c + 1);
}
```

339. Nested List Weight Sum

```
nested list of integers nestedList. Each element an integer or a list.
depth of an integer is the number of lists inside of.
Return the sum of each integer in nestedList multiplied by its depth.

Input: nestedList = [[1,1],2,[1,1]]
Output: 10
Explanation: Four 1's at depth 2, one 2 at depth 1. 1*2 + 1*2 + 2*1 + 1*2 + 1*2 = 10.
```

```遍历组，数总数深，递组加深```

```
public int depthSum(List<NestedInteger> nestedList) {
    return dfs(nestedList,1);
}
private int dfs(List<NestedInteger> list, int depth) {
    int total =0;
    for(NestedInteger nested : list){
        if(nested.isInteger()){total += nested.getInteger() * depth;} 
        else {total += dfs(nested.getList(), depth + 1);}
    }
    return total;
}
```

366. Find Leaves of Binary Tree

root of binary tree, collect tree's nodes 
```
Input: root = [1,2,3,4,5]
Output: [[4,5,3],[2],[1]]
```
```节空-1，层1大递左递右，层尽加组，组层加节，返层```
```
public List<List<Integer>> findLeaves(TreeNode root) {
    List<List<Integer>> res = new ArrayList<>();
    dfs(root, res);
    return res;
}
private int dfs(TreeNode node, List<List<Integer>> res){
    if(null==node)  return -1;
    int level = 1 + Math.max(dfs(node.left, res), dfs(node.right, res));
    if(res.size()<level+1){res.add(new ArrayList<>())};
    res.get(level).add(node.val);
    return level;
}
```
