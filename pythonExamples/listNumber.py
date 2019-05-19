#!/usr/bin/python3

###	Task ### 
### unenq list 5 kamayakan tverov, stanal myus list@ aynpes, vor lini index@ nranic hajord ev naxord tveri gumar@, 
# indexneri arajin ev verjin tver@ gumarel (hajord ev verjin/naxor ev arajin) tverin


list1 = list()
print("Enter five element for list")

for el in range(5):
	elem = int(input())
	list1.append(elem)
print(list1)

list2 = []
list2.extend(list1)

for i in range(len(list1)):
	if i == 0:
		list1[i] = list2[i+1] + list2[len(list1)-1]
	if i == len(list1)-1:
		list1[i] = list2[i-1] + list2[0]
	if i > 0 and i < len(list1)-1:
		list1[i] = list2[i-1] + list2[i+1]
	
print(list1)
