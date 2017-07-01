function Feature2Extration()
    [input1, input2, input3] = textread('Char_Index.txt', '%d %d %s', 1000, 'headerlines', 1);
    indexFileName = input3;
    fid = fopen('feature2.txt', 'w+');
    range=8;
    for k=1:1000
       fprintf('output fearture2 %d\r\n', k);
       A = imread(strcat('Char_Image_Binary\', char(indexFileName(k,1))));
       t = graythresh(A);
       B = im2bw(A, t);
       [a, b]=size(B);
       x = ceil(a / range);
       y = ceil(b / range);
       C = zeros(1, x * y);
       S = zeros(1, x * y);
       
       for i=1:a
          for j=1:b
            n = (ceil(i / range) - 1) * y + ceil(j / range);
            C(1, n) = C(1, n) + B(i, j);
            S(1, n) = S(1, n) + 1;
          end
       end
       
       fprintf(fid,'%d',k);
       fprintf(fid,'%s','       ');
       
       for i = 1:x * y -1
          fprintf(fid, '%g', C(1,i) / S(1,i));
          fprintf(fid, '%s', ',');
       end
       
       if k~=1000
           fprintf(fid, '%g\r\n', C(1, x*y) / S(1,x*y));
       else
           fprintf(fid, '%g', C(1, x*y) / S(1,x*y));
       end
    end
    
    fclose(fid);


