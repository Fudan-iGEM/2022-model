clear;
clc;
M=10;N=10;%轴M、横轴N
rgb=imread('sample5.png');
[m,n,c]=size(rgb);
xb=round(m/M)*M;yb=round(n/N)*N;%找到能被整除的M,N
rgb=imresize(rgb,[xb,yb]);
[m,n,c]=size(rgb);
count =1;
result_ratio=zeros(M*N,1);
for i=1:M
    for j=1:N
        % 1） 分块
        block = rgb((i-1)*m/M+1:m/M*i,(j-1)*n/N+1:j*n/N,:); % 图像分成块
        Pic0 = block;
        Pic0 = rgb2gray(Pic0);
        Pic1 = imbinarize(Pic0);%灰度图二值化
        II = 1 - Pic1;
        imshow(II);
        S=numel(II);%像素点总数
        s=sum(sum(II));%白色点总数
        ratio=s/S;%白色面积比
        
   %写上要对每一块的操作
     subplot(M,N,count);
     imshow(block);
     result_ratio(count)=ratio;
        count = count+1;
    end
end
