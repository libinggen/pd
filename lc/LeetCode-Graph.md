# Graph

## Easy

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

## Medium


## Hard
