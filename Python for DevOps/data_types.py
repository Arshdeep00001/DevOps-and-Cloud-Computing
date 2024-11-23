# https://jovian.ai/aakashns/python-variables-and-data-types
# https://www.w3schools.com/python/python_ref_list.asp

my_color = 'blue,green,yellow,red'
counter = 10.2
my_list =['a','b',1,2]
my_bool = True
split_method = my_col.split(",")
list_b = ['c', 'd', my_list,3,4]
list_c = ['x','y',99]
list_length = len(list_b)
my_list.append(3)
my_list.insert(2, 'c')
my_list.remove(2)   # list.remove() takes exactly one argument
my_list.pop(1)    # list.pop() takes exactly one argument
my_list.pop()   # If no index is provided, the pop method removes the last element of the list.
#print ('a' in my_list)  # You can test whether a list contains a value using the 'in' operator.
lists_combine = my_list + list_c + ['z',100]    # To combine two or more lists, use the + operator. This operation is also called concatenation.
list_copy = my_list.copy()    # To create a copy of a list, use the copy method. Modifying the copied list does not affect the original.
# Even if we modify the copy list, the original list will remain unchanged


# print (my_color)
# print (counter)
# print (my_list)
# print (my_bool)
# print (split_method)
# print (list_b)
# print (type(my_col))
# print (type(counter))
# print (type(my_list)) 
# print (type(my_bool))
# print (type(split_method))
# print (list_length)
# print (list_b[1])
# print (my_list[1:3])
# print (lists_combine)
print (list_copy)
