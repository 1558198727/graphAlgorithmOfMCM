% Floyd算法实现
% 时间复杂度: O(n^3)
% 函数参数说明:
%  a           - 赋权邻接矩阵
%  [start]    - 起始位置(可选)
%  [terminal] - 终止位置(可选)
% 返回值说明:
%  D - 最短距离矩阵,D(i,j)表示i与j之间的最短距离
%  paths - 最短路径矩阵,paths(i, j)表示i与j之间的最短路径矩阵
%  minLength - i与j之间的最短距离
%  minPath - i与j之间的最短距离矩阵
% 例子:
%  [D, paths, minLength, minPath] = Floyd(a, 1, 10)
function [D, paths, minLength, minPath] = myfloyd(a, start, terminal)
    % 将邻接矩阵进行复制
    D = a;
    % 获取节点的个数
    n = size(D, 1);
    % 建立最短路径矩阵
    paths = zeros(n ,n);
    % 计算两节点之间是否通达
    for i = 1:n
        for j = 1:n
            if D(i, j) ~= inf
                % 如果两节点直接的距离不为inf的话，表示两节点可以直接通达
                paths(i, j) = j;
            end
        end
    end
    % 遍历最短节点
    for k = 1:n
        for i = 1:n
            for j = 1:n
                if D(i, k) + D(k, j) < D(i, j)
                    % 如果两节点可通过第三方节点可通达，并且距离更短，则更新path矩阵中两点的最短距离
                    D(i, j) = D(i, k) + D(k, j);
                    paths(i, j) = paths(i, k);
                end
            end
        end
    end
    % 如果输入了3个参数，则表示需要进行两位置的最短距离计算
    if nargin == 3
        % 开始计算起始点到终点的最短路径
        % 得到最短距离
        minLength = D(start, terminal);
        % 起始点
        minPath(1) = start;
        i = 1;
        % 遍历取得其中的最短路径节点
        while paths(minPath(i), terminal) ~= terminal
            k = i + 1;
            % 添加下一节点
            minPath(k) = paths(minPath(i), terminal);
            i = i + 1;
        end
        % 最后一个节点为终点
        minPath(i+1) = terminal;
    end
end