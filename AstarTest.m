[map,detect_map]=getmap1();
global all_pts;%所有可行点
cnt_allpts=0;
for i=1:42
    for j=1:82
        if(map(i,j)==0)
            cnt_allpts=cnt_allpts+1;
            all_pts(cnt_allpts,:)=[i,j];
        else
            plot(j,i,'o');
            hold on;
        end
    end
end
stpt=[15,20];
edpt=[23,71];
path=Astar(stpt,edpt);

plot(path(:,2),path(:,1));
axis([1,82,1,42]);
grid on;