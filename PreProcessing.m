function PreProcessing()
[input1, input2, input3] = textread('Char_Index.txt','%d %d %s',1000, 'headerlines',1);
indexFileName = input3;
for k=1:1000
    A=imread(strcat('Char_Image\',char(indexFileName(k,1))));
    t=graythresh(A); 
    B=im2bw(A,t);
    [a,b]=size(B);

    % 修复生成的灰度图片，出现的1和0的置换现象
    if(B(1,1)+B(1,b)+B(a,1)+B(a,b)>=2)
        for i=1:a
            for j=1:b
                B(i,j)=1-B(i,j);
            end
        end
    end
    imwrite(B,strcat('Char_Image_Binary\',char(indexFileName(k,1))));
end