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
public int rangeSumBST(TreeNode root, int low, int high) {
    if(root == null){return 0;};
    if(root.val > high){return rangeSumBST(root.left,low,high);};
    if(root.val < low){return rangeSumBST(root.right,low,high);};
    return root.val + rangeSumBST(root.left,low,high) + rangeSumBST(root.right,low,high);
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
