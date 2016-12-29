function [u re]=KMeans(data,N)   
    [m n]=size(data);
    ma=zeros(n);
    mi=zeros(n);
    u=zeros(N,n);
    for i=1:n
       ma(i)=max(data(:,i));
       mi(i)=min(data(:,i));
       for j=1:N
            u(j,i)=ma(i)+(mi(i)-ma(i))*rand(); 
       end
    end

    while 1
        pre_u=u; 
        for i=1:N
            tmp{i}=[]; 
            for j=1:m
                tmp{i}=[tmp{i};data(j,:)-u(i,:)];
            end
        end
        
        quan=zeros(m,N);
        for i=1:m 
            c=[];
            for j=1:N
                c=[c norm(tmp{j}(i,:))];
            end
            [junk index]=min(c);
            quan(i,index)=norm(tmp{index}(i,:));           
        end
        
        for i=1:N      
           for j=1:n
                u(i,j)=sum(quan(:,i).*data(:,j))/sum(quan(:,i));
           end           
        end
        
        if norm(pre_u-u)<0.1
            break;
        end
    end
    
    re=[];
    for i=1:m
        tmp=[];
        for j=1:N
            tmp=[tmp norm(data(i,:)-u(j,:))];
        end
        [junk index]=min(tmp);
        re=[re;data(i,:) index];
    end