thL = -pi/2:0.01:pi/3;
thK = 2*thL + pi/6;
[thL_g, thK_g] = meshgrid(thL, thK);

l1 = 10:1:1000;
l2 = 10:1:1000;
z = zeros([3, length(thL)]);
max_s = zeros([3,length(l2),length(l1)]);
min_s = zeros([3,length(l2),length(l1)]);

for i = 1:length(l1)
    disp(i)
    for j = 1:length(l2)
        z(1,:) = l1(i)*sin(thL) + l2(j)*sin(2*thL + pi/6);
        z(2,:) = thL;
        z(3,:) = l1(i);
        
        idx_min = find(z(1,:) == min(z(1,:)));
        idx_max = find(z(1,:) == max(z(1,:)));
    %   idx(1,:) = z(:,)
        %disp([idx_min idx_max]);
        %disp([z(:, idx_min); z(:,idx_max)]);
        max_s(:,j,i) = z(:,idx_max,:);
        min_s(:,j,i) = z(:,idx_min,:);

        
        %plot3(z(:,2), z(:,3), z(:,1));
        %hold on
    end
end
for i = 1:length(l1)
    
    if mod(i,10) == 0
        disp("Plotting")
        disp(i)
    end
     for j = 1:length(l2)
        plot3(max_s(2,j,i),max_s(3,j,i), max_s(1,j,i))
        hold on
        plot3(min_s(2,j,i),min_s(3,j,i), min_s(1,j,i))
        hold on
     end
end
xlabel("thH")
ylabel("l1")
zlabel("z")
