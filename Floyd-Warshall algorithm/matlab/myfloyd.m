% Floyd�㷨ʵ��
% ʱ�临�Ӷ�: O(n^3)
% ��������˵��:
%  a           - ��Ȩ�ڽӾ���
%  [start]    - ��ʼλ��(��ѡ)
%  [terminal] - ��ֹλ��(��ѡ)
% ����ֵ˵��:
%  D - ��̾������,D(i,j)��ʾi��j֮�����̾���
%  paths - ���·������,paths(i, j)��ʾi��j֮������·������
%  minLength - i��j֮�����̾���
%  minPath - i��j֮�����̾������
% ����:
%  [D, paths, minLength, minPath] = Floyd(a, 1, 10)
function [D, paths, minLength, minPath] = myfloyd(a, start, terminal)
    % ���ڽӾ�����и���
    D = a;
    % ��ȡ�ڵ�ĸ���
    n = size(D, 1);
    % �������·������
    paths = zeros(n ,n);
    % �������ڵ�֮���Ƿ�ͨ��
    for i = 1:n
        for j = 1:n
            if D(i, j) ~= inf
                % ������ڵ�ֱ�ӵľ��벻Ϊinf�Ļ�����ʾ���ڵ����ֱ��ͨ��
                paths(i, j) = j;
            end
        end
    end
    % ������̽ڵ�
    for k = 1:n
        for i = 1:n
            for j = 1:n
                if D(i, k) + D(k, j) < D(i, j)
                    % ������ڵ��ͨ���������ڵ��ͨ����Ҿ�����̣������path�������������̾���
                    D(i, j) = D(i, k) + D(k, j);
                    paths(i, j) = paths(i, k);
                end
            end
        end
    end
    % ���������3�����������ʾ��Ҫ������λ�õ���̾������
    if nargin == 3
        % ��ʼ������ʼ�㵽�յ�����·��
        % �õ���̾���
        minLength = D(start, terminal);
        % ��ʼ��
        minPath(1) = start;
        i = 1;
        % ����ȡ�����е����·���ڵ�
        while paths(minPath(i), terminal) ~= terminal
            k = i + 1;
            % �����һ�ڵ�
            minPath(k) = paths(minPath(i), terminal);
            i = i + 1;
        end
        % ���һ���ڵ�Ϊ�յ�
        minPath(i+1) = terminal;
    end
end