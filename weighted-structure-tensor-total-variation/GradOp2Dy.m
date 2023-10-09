function Dy=GradOp2Dy(f,bc) %Gradient operator with boundary conditions bc
[r,c]=size(f);
Dy=zeros(r,c,2);
Gaussian = fspecial('gaussian',[5,5],1.25); 
f=conv2(f,Gaussian,'same'); 
y1=shift(f,[-1,0],bc)-f; 
y2=shift(f,[0,-1],bc)-f; 
Tx = 1./ (1 + 4*abs(y1));
Ty = 1./ (1 + 4*abs(y2));
Dy(:,:,1)=Tx;
Dy(:,:,2)=Ty;
end