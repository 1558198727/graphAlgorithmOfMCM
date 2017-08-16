function [minD,path] = BellmanFord(w,start,terminal)
% input:
% w:ͼ�Ĵ�Ȩ�ڽӾ���
% start:ԭ����
% terminal:Ŀ�ĵ���
% 
% output:
% minD:��㵽�յ����̾���
% path:��һ����������������Դ�㵽Ŀ�ĵ��·�������û������Ŀ�ĵ�
%       ���iλ����Դ�㵽�ڵ�i�����·����i��ǰ���ڵ�

%�õ���Ҫ�Ĳ���
G = sparse(w);
[u,v,c] = find(G);

V = size(w,1);
E = length(u);

f = zeros(1,V);

%�㷨��ʼ��
dist = inf(1,V);
dist(start) = 0;

%��ѭ�����㷨���ģ�
for k = 1:(V - 1)
    for e = 1:E
       i = u(e);j = v(e);
       if dist(j) > dist(i) + c(e)
          dist(j) = dist(i) + c(e);
          f(j) = i;
       end
    end
end

%�������
for e = 1:E
    i = u(e);j = v(e);
    if dist(j) > dist(i) + c(e)
       minD = [];
       path = 0;
       return;
    end
end

%���
if nargin == 2
    minD = dist;
    path = f;
else
   minD = dist(terminal);
   if minD ~= inf
      %��f�л���
      path(1) = terminal;
      forward = 1;
      while path(forward) ~= start
         path(forward + 1) = f(path(forward));
         forward = forward + 1;
      end
      %����˳��
      L = length(path);
      path = path(L:-1:1);
   else
       path = 0;%��ʾ���ɴ�
   end
end
end





