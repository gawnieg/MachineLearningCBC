clear Tester3
Sample1 = magic(5)
for i = 1:3
    Tester3(i,:)=Sample1(i,:);
end

%Tester1(:,:)=Sample1(2,:)

index = 3;
H = Sample1(:,[1:index])

H = H([1:3],:)