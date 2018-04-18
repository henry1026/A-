function path=Astar(st_pos,ed_pos)
%openlist
%closelist
global all_pts;%所有可行点
openlist(1,1:2)=st_pos;
openlist(1,3:6)=0;%分别表示f,g,h,父节点
openlist(1,7)=checkin(all_pts,st_pos);%获取起始点的序号
closelist=[];
openlist_cnt=1;
closelist_cnt=0;
while(openlist_cnt~=0)
    i=find(openlist(:,3)==min(openlist(:,3)));
    temp_i=i(1);
    if(openlist(temp_i,1:2)==ed_pos)%到达终点
        ed_index=openlist(temp_i,6);
        break;
    end
    x0=openlist(temp_i,1);
    y0=openlist(temp_i,2);
    nearpt=[x0-1,y0-1;x0-1,y0;x0-1,y0+1;x0,y0+1;x0+1,y0+1;x0+1,y0;x0+1,y0-1;x0,y0-1];%该点周边的8个点
    for j=1:8
        flag=checkin(all_pts,nearpt(j,:));%flag为nearpt在allpts中的序号
        flag1=0;
        if(~isempty(closelist))
            flag1=checkin(closelist(:,1:2),nearpt(j,:));
        end
        flag2=checkin(openlist(:,1:2),nearpt(j,:));
        if(flag2~=0)%节点已经在openlist中
            tempg=openlist(temp_i,4)+norm(openlist(temp_i,1:2)-nearpt(j,:));%计算当前节点到该节点的g值
            if(tempg<openlist(flag2,4))%若当前节点到该节点的g值小于该节点之前的g值，则进行更新
                openlist(flag2,4)=tempg;
                openlist(flag2,3)=openlist(flag2,4)+openlist(flag2,5);
                openlist(flag2,6)=openlist(temp_i,7);
            end
        elseif(flag~=0 && flag1==0)%判断该点不在openlist中，在总列表内,并且不在closelist
            openlist_cnt=openlist_cnt+1;
            openlist(openlist_cnt,1:2)=nearpt(j,:);
            openlist(openlist_cnt,4)=openlist(temp_i,4)+norm(openlist(temp_i,1:2)-nearpt(j,:));
            openlist(openlist_cnt,5)=norm(nearpt(j,:)-ed_pos);
            openlist(openlist_cnt,3)=openlist(openlist_cnt,4)+openlist(openlist_cnt,5);
            openlist(openlist_cnt,6)=openlist(temp_i,7);
            openlist(openlist_cnt,7)=flag;
        end
    end
    closelist_cnt=closelist_cnt+1;
    closelist(closelist_cnt,:)=openlist(temp_i,:);
    openlist(temp_i,:)=[];
    openlist_cnt=openlist_cnt-1;
end
path_index=ed_index;
path(1,:)=all_pts(path_index,:);
path_cnt=1;
while(path_index~=0)
    tempindex=find(closelist(:,7)==path_index);
    path_index=closelist(tempindex,6);
    path_cnt=path_cnt+1;
    if(path_index~=0)
        path(path_cnt,:)=all_pts(path_index,:);
    end
end



