#Variables Scope:
#1. Local: The interpreter first checks for the variable in the current local scope.
#2. Enclosing: If not found, it checks the enclosing (nonlocal) scope.
#3. Global: Then it checks the global scope.
#4. Built-in: Finally, it checks the built-in scope.

x=5  #global
def out():
    x=10  #enclosing
    def inner():
        x=20  #local
        print("in", x)
    inner()   
    print("out", x)
out()
print(x)
print (len([1,2]))  #built-in variable (len)