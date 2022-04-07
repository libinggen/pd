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

1791. Find Center of Star Graph 找出星型图的中心节点

```
undirected star graph consisting of n nodes labeled from 1 to n. star graph is graph where there is one center node and exactly n - 1 edges that connect center node with every other node.
2D integer array edges where each edges[i] = [ui, vi] indicates that there is edge between nodes ui and vi. Return center of star graph.

Input: edges = [[1,2],[2,3],[4,2]]
Output: 2
Explanation: As shown in the figure above, node 2 is connected to every other node, so 2 is the center.
```
```
无向星型图，节点1到n。星型图1中心节点，有n-1边连其它节点。二维整数边数组，i边顶点ui、vi连边。返回星型图中心节点。
```
```
1等返1，返2
```
```
public int findCenter(int[][] edges) {
    if(edges[0][0] == edges[1][0] || edges[0][0] == edges[1][1]) return edges[0][0];
    return edges[0][1];
}
```
```
遍边，1顶加度、2顶加度，遍边n-1度边返顶
```
```
public int findCenter(int[][] edges) {
    int n = edges.length + 1;
    int[] degrees = new int[n + 1];
    for (int[] edge : edges) {
        degrees[edge[0]]++;
        degrees[edge[1]]++;
    }
    for (int i = 1; ; i++) {
        if (degrees[i] == n - 1) {return i;}
    }
}
```

1971. Find if Path Exists in Graph 寻找图中是否存在路径

```
bi-directional graph with n vertices, where each vertex is labeled from 0 to n - 1 (inclusive). edges in graph are represented as 2D integer array edges, where each edges[i] = [ui, vi] denotes bi-directional edge between vertex ui and vertex vi. Every vertex pair is connected by at most one edge, and no vertex has an edge to itself.
determine if there is valid path that exists from vertex source to vertex destination.
edges and integers n, source, and destination, return true if there is valid path from source to destination, or false otherwise.

Input: n = 3, edges = [[0,1],[1,2],[2,0]], source = 0, destination = 2
Output: true
Explanation: There are two paths from vertex 0 to vertex 2:
- 0 → 1 → 2
- 0 → 2
```
```
n顶点双向图，顶点标从0到n-1。二维整数边数组，i边顶点ui、vi双向边。顶点对一边，无自连边。从始到终有效路径。边数组、整数n、始终点，有返真，无返假。
```

```
置假，始终等真；
遍边，节邻、邻节双向顶点，递始终；
始访真找真返，始访真，遍始邻，邻终等真，未访递邻；
```
```
boolean found;
public boolean validPath(int n, int[][] edges, int start, int end) {
    found = false;

    if(start == end) return true;

    Map<Integer,List<Integer>> graph = new HashMap();
    boolean[] visited = new boolean[n];

    for(int i = 0 ; i < n ; i++){
        graph.put(i, new ArrayList());
    }
    for(int[] edge : edges){
       graph.get(edge[0]).add(edge[1]);
       graph.get(edge[1]).add(edge[0]);
    }

    dfs(graph,visited,start,end);
   
    return found;
}

private void dfs(Map<Integer,List<Integer>> graph,boolean[] visited, int start, int end){
    if(visited[start] || found) return;
    visited[start] = true;
    for(int nei : graph.get(start)){
        if(nei == end){found = true;break;}
        if(!visited[nei]) dfs(graph, visited, nei, end);
    }
}
```

```
始终等真，路组假，始路真，有下真；
终路假且有下真，有下假，遍边，顶1真、顶2假有下真顶2真，顶2真有下真顶1真；
```
```
public boolean validPath(int n, int[][] edges, int source, int destination) {
    if(source == destination) return true;

    boolean[] path = new boolean[n];
    path[source] = true;
    boolean hasNext = true;

    while(!path[destination] && hasNext) {
        hasNext = false;
        for(int[] edge : edges) {
            if(path[edge[0]]) {
                if(!path[edge[1]]) {hasNext = true;path[edge[1]] = true;}
            }
            else if(path[edge[1]]) {hasNext = true;path[edge[0]] = true;}
        }
    }

    return path[destination];
}
```

## Medium


## Hard
