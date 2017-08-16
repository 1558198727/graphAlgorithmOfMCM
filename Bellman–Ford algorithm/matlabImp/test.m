%∂‘À„∑®µƒ≤‚ ‘
w = [0 -1 4 inf inf
    inf 0 3 2 2
    inf inf 0 inf inf
    inf 1 5 0 inf
    inf inf inf -3 0];
[minD,path] = BellmanFord(w,1)

[minD,path] = BellmanFord(w,1,4)