function flag=checkin(ptset,nearpt)%判断附近点nearpt是否在集合ptset内，返回该点的序号
m1=size(ptset);
flag=0;%不在
if(m1(1)==0)
    return;
end
for k=1:m1(1)           
    if(ptset(k,:)==nearpt)
        flag=k;        
        break;
    end  
end