function [p,r0,r]=daniels(mata, matb, nperm)
veca=asvect(mata);
vecb=asvect(matb);
r0 = veca*(vecb');
r = zeros(nperm, 1);
[m,ncol]=size(mata);

n=((m-1)*m)/2;

for(i = (1:nperm))
    ni=randperm(n);
    r(i) =veca*(vecb(ni))';
end

p = (sum(r >= r0))/(nperm + 1);



function vect=asvect(mat)
[m,ncol]=size(mat);
n=((m-1)*m)/2;
k=1;
vect=zeros(1,n);
for (i = (2:m))
    for ( j = (1:(i-1)))
        vect(k)=mat(i,j);
        k=k+1;
    end
end

