%test
W=[0 50 inf 40 25 10  
    50 0 15 20 inf 25  
    inf 15 0 10 20 inf   
    40 20 10 0 10 25  
    25 inf 20 10 0 55  
    10 25 inf 25 55 0];
[distance,path]=Dijk(W,1,4)
