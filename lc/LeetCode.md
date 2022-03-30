# LeetCode

https://leetcode.com

## Java

## Easy

1. Two Sum
```
public int[] twoSum(int[] nums, int target) {
    Map<Integer,Integer> map = new HashMap<>();
    for(int i=0;i<nums.length;i++) {
        if(map.containsKey(target-nums[i])){
            return new int[]{map.get(target-nums[i]),i};
        }
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

345. Reverse Vowels of a String
```
public String reverseVowels(String s) {
    char carr[] = s.toCharArray();
    String vs = "aeiouAEIOU";
    int left = 0, right = s.length()-1;
    while(left<right){
        while(left<right && !vs.contains(carr[left]+""))
            left++;
        while(left<right && !vs.contains(carr[right]+""))
            right--;
        char temp = carr[left];
        carr[left] = carr[right];
        carr[right] = temp;
        left++;
        right--;
    }
    return new String(carr);
}
```

938. Range Sum of BST

二叉搜索树根结点，范围结点和

root node of a binary search tree, sum of values of all nodes in the inclusive range
```
Input: root = [10,5,15,3,7,null,18], low = 7, high = 15
Output: 32
```

```BST 左<节<右```

深度优先 递左右 插底

```节空0，节高递左，节低递右，节递左右```

```
public int rangeSumBST(TreeNode root, int low, int high) {
    if(root == null){return 0;};
    if(root.val > high){return rangeSumBST(root.left,low,high);};
    if(root.val < low){return rangeSumBST(root.right,low,high);};
    return root.val + rangeSumBST(root.left,low,high) + rangeSumBST(root.right,low,high);
}
```

广度优先 加左右 横扫

```总0，建队，队加节，队非空，队头节，节空过，节高加左，节低加右，总加节，队加左右，返总```

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
                if(sum==0){
                    res.add(Arrays.asList(nums[i],nums[lo++],nums[hi--]));
                    while(lo<hi&&nums[lo] == nums[lo-1]){++lo;}
                }else if(sum<0){
                    ++lo;
                }else {
                    --hi;
                }
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
        if(sum == target)
            return new int[]{l+1, r+1};
        else if(sum < target){
            ++l;
        }else{
            --r;
        }
    }
    return null;
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
        if(nested.isInteger()){
            total += nested.getInteger() * depth;
        } else {
            total += dfs(nested.getList(), depth + 1);
        }
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
    height(root, res);
    return res;
}
private int height(TreeNode node, List<List<Integer>> res){
    if(null==node)  return -1;
    int level = 1 + Math.max(height(node.left, res), height(node.right, res));
    if(res.size()<level+1){res.add(new ArrayList<>())};
    res.get(level).add(node.val);
    return level;
}
```
