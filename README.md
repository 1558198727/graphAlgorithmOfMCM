为了中国大学生数学建模竞赛所做的图论方面的算法库  

贝尔曼-福特算法(Bellman–Ford algorithm)  

贝尔曼-福特算法与迪科斯彻算法类似，都以松弛操作为基础，即估计的最短路径值渐渐地被更加准确的值替代，直至得到最优解。在两个算法中，计算时每个边之间的估计距离值都比真实值大，并且被新找到路径的最小长度替代。 然而，迪科斯彻算法以贪心法选取未被处理的具有最小权值的节点，然后对其的出边进行松弛操作；而贝尔曼-福特算法简单地对所有边进行松弛操作，共|V | − 1次，其中 |V |是图的点的数量。在重复地计算中，已计算得到正确的距离的边的数量不断增加，直到所有边都计算得到了正确的路径。这样的策略使得贝尔曼-福特算法比迪科斯彻算法适用于更多种类的输入。  
贝尔曼-福特算法的最多运行O（|V|·|E|)次，|V|和|E|分别是节点和边的数量）

---

戴克斯特拉算法（Dijkstra's algorithm）

是由荷兰计算机科学家艾兹赫尔·戴克斯特拉提出。迪科斯特拉算法使用了广度优先搜索解决赋权有向图的单源最短路径问题，算法最终得到一个最短路径树。该算法常用于路由算法或者作为其他图算法的一个子模块。举例来说，如果图中的顶点表示城市，而边上的权重表示城市间开车行经的距离，该算法可以用来找到两个城市之间的最短路径。
该算法的输入包含了一个有权重的有向图 G，以及G中的一个来源顶点 S。我们以 V 表示 G 中所有顶点的集合。每一个图中的边，都是两个顶点所形成的有序元素对。(u, v) 表示从顶点 u 到 v 有路径相连。我们以 E 表示G中所有边的集合，而边的权重则由权重函数 w: E → [0, ∞] 定义。因此，w(u, v) 就是从顶点 u 到顶点 v 的非负权重（weight）。边的权重可以想像成两个顶点之间的距离。任两点间路径的权重，就是该路径上所有边的权重总和。已知有 V 中有顶点 s 及 t，Dijkstra 算法可以找到 s 到 t 的最低权重路径(例如，最短路径)。这个算法也可以在一个图中，找到从一个顶点 s 到任何其他顶点的最短路径。
最初的戴克斯特拉算法不采用最小优先级队列，时间复杂度是O(|V|^2)(其中|V|为图的顶点个数)。通过斐波那契堆实现的迪科斯彻算法时间复杂度是O(|E|+|V|\log |V|) (其中|E|是边数) （Fredman & Tarjan 1984）。对于不含负权的有向图，这是目前已知的最快的单源最短路径算法。

---

Floyd-Warshall算法（Floyd-Warshall algorithm）
中文亦称弗洛伊德算法，是解决任意两点间的最短路径的一种算法，可以正确处理有向图或负权（但不可存在负权回路)的最短路径问题，同时也被用于计算有向图的传递闭包。  
Floyd-Warshall算法的时间复杂度为 O(N^3)，空间复杂度为 O(N^2)。

--  
普里姆算法（Prim algorithm）  
图论中的一种算法，可在加权连通图里搜索最小生成树。意即由此算法搜索到的边子集所构成的树中，不但包括了连通图里的所有顶点，且其所有边的权值之和亦为最小。该算法于1930年由捷克数学家沃伊捷赫·亚尔尼克发现；并在1957年由美国计算机科学家罗伯特·普里姆独立发现；1959年，艾兹格·迪科斯彻再次发现了该算法。因此，在某些场合，普里姆算法又被称为DJP算法、亚尔尼克算法或普里姆－亚尔尼克算法。