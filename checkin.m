function flag=checkin(ptset,nearpt)%�жϸ�����nearpt�Ƿ��ڼ���ptset�ڣ����ظõ�����
m1=size(ptset);
flag=0;%����
if(m1(1)==0)
    return;
end
for k=1:m1(1)           
    if(ptset(k,:)==nearpt)
        flag=k;        
        break;
    end  
end