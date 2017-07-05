function Feature1Extraction()
    [input1, input2, input3] = textread('Char_Index.txt', '%d %d %s', 1000, 'headerlines', 1);
    indexFileName = input3;
    fid = fopen('feature3.txt', 'w+');
    for k = 1: 1000
        fprintf('output fearture3 %d\r\n', k);
        A = imread(strcat('Char_Image_Binary\', char(indexFileName(k, 1))));
        t = graythresh(A);
        B = im2bw(A, t);
        [a, b] = size(B);
        C = zeros(1, (a + a + b + b));
        
        for i = 1:a
           for j = 1:b
               if (B(i,j) == 1) 
                    break;
               else
                   C(1,i) = C(1,i) + 1;
               end
           end
        end
        
        for i=1:a
            for j=1:b
               if (B(i, b - j + 1) == 1) 
                   break;
               else
                   C(1,a + i)=C(1, a + i) + 1;
               end    
            end
        end
        
        for j=1:b
            for i=1:a
                if (B(i,j) == 1)
                    break; 
                else
                    C(1,a + a + j)=C(1,a + a + j)+1; 
                end
            end
        end
    
        for j=1:b
            for i=1:a
                if (B(a - i + 1,j) == 1)
                    break; 
                else
                    C(1,a + a + b + j)=C(1, a + a + b + j)+1; 
                end
            end
        end 
    
        fprintf(fid, '%d', k);
        fprintf(fid, '%s',',');
        for i=1: (2 * a + 2 * b -1)
            fprintf(fid, '%d', C(1,i));
            fprintf(fid, '%s', ',');
        end
    
        if k~=1000
            fprintf(fid, '%d\r\n', C(1,2 * a + 2 * b));
        else
            fprintf(fid, '%d', C(1,2 * a + 2 * b));
        end
    end
    
    fclose(fid);