function Feature4Extraction() 
    [input1, input2, input3] = textread('Char_Index.txt', '%d %d %s', 1000, 'headerlines', 1);
    indexFileName = input3;
    fid = fopen('feature4.txt', 'w+');
    for k=1:1000
        fprintf('output fearture4 %d\r\n', k);
        A=imread(strcat('Char_Image_Binary\', char(indexFileName(k,1))));
        t=graythresh(A);
        B=im2bw(A,t);
        [a,b]=size(B);
        C=zeros(1,a+b);

        for i=1:a
            for j=1:b
                if ((j == 1 || B(i,j - 1) == 0) && B(i,j) == 1) 
                    C(1,i)=C(1,i)+1;
                end
            end
        end

        for j=1:b
            for i=1:a
                if ((i == 1 || B(i - 1, j) == 0) && B(i,j) == 1)
                   C(1, a+j) = C(1, a+j) + 1;
                end
            end
        end

        fprintf(fid, '%d', k);
        fprintf(fid, '%s', ',');

        for i=1:a+b-1
            fprintf(fid, '%d', C(1,i));
            fprintf(fid, '%s', ',');
        end

        if k~=1000
            fprintf(fid, '%d\r\n', C(1, a+b));
        else
            fprintf(fid, '%d', C(1, a+b));
        end
    end
    fclose(fid);