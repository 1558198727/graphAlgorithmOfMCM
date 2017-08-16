function [minD,path] = BellmanFord(w,start,terminal)
% input:
% w:图的带权邻接矩阵
% start:原点标号
% terminal:目的点标号
% 
% output:
% minD:起点到终点的最短距离
% path:是一个向量，储存了重源点到目的点的路径。如果没有输入目的点
%       则第i位储存源点到节点i的最短路径上i的前驱节点

%得到必要的参数
G = sparse(w);
[u,v,c] = find(G);

V = size(w,1);
E = length(u);

f = zeros(1,V);

%算法初始化
dist = inf(1,V);
dist(start) = 0;

%主循环（算法核心）
for k = 1:(V - 1)
    for e = 1:E
       i = u(e);j = v(e);
       if dist(j) > dist(i) + c(e)
          dist(j) = dist(i) + c(e);
          f(j) = i;
       end
    end
end

%负环检测
for e = 1:E
    i = u(e);j = v(e);
    if dist(j) > dist(i) + c(e)
       minD = [];
       path = 0;
       return;
    end
end

%输出
if nargin == 2
    minD = dist;
    path = f;
else
   minD = dist(terminal);
   if minD ~= inf
      %重f中回退
      path(1) = terminal;
      forward = 1;
      while path(forward) ~= start
         path(forward + 1) = f(path(forward));
         forward = forward + 1;
      end
      %调整顺序
      L = length(path);
      path = path(L:-1:1);
   else
       path = 0;%表示不可达
   end
end
end





