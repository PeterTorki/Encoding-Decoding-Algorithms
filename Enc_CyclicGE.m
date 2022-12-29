function v=Enc_CyclicGE(u,g)

%u=[1 1 0 1], or u=[1 0 1 0], g(x)=1+x^2+x^3
% u write it in a normal way

%Cyclic EnCode in systematic Form by using Difference Equation 

%check if u is binary or not

if mod(u,2)==u
    k=length(u)
    %poly2sym fun is used to write polynomial equation of binary vector g[1 0 1 1] but write it in reverse order [1 1 0 1] to get the right equation
    gx=poly2sym(g)
    %find is used to get index of non zero elements in vector g which will be in ex:1 2 4
    polyPowers = find(g) - 1;
    paritybits=max(polyPowers);
    n=k+paritybits;
    
    v=zeros([1,paritybits])
    v=[v u] 
    
    syms x
    zx=x^n+1
    
    %sym2poly returns the numeric vector of coefficients of the symbolic polynomial 
    %when you use deconv function  parameters must be vestors"Binary"
    %fliplr Flip array left to right
    
    zxb=sym2poly(zx)
    [h,r]=deconv(zxb,g)
    h=mod(h,2)
    hx=poly2sym(h)
    hcoeff=fliplr(h)
    
    %index in matlab for vector start from 1 
    m=hcoeff(1:paritybits+1)
    x=length(v)
    y=length(u)
    for j=0:paritybits-1
        v(paritybits-j)=sum(m.*v(x:-1:y));
        v(paritybits-j)=mod(v(paritybits-j),2)
        x=x-1;
        y=y-1;
    end 
  
else
    disp('u must be a binary')
end
end