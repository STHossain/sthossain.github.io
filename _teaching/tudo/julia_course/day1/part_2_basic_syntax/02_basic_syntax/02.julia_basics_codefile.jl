

# ===================================
## CodeBlock 1.
rand() # draw one random number
rand(10) # draw a vector of random numbers, notice the dimension

rand(3, 3) # draw a matrix of random numbers
rand(1:5) # draw a random number from 1 to 5
rand(1:5, 2, 4) # a 2 by 4 matrix of random integers between 1 to 5
rand(  "stat", "business", "econ", "data science", "physics") ## will throw an error
rand(  ("stat", "business", "econ", "data science", "physics") ) ## fine
rand(  ["stat", "business", "econ", "data science", "physics"] ) ## fine

# ===================================


# ===================================
## CodeBlock 2.
# ] add plots ## add the package, this you have to do only once in your lifetime
using Plots # everytime you use any package, you have to use `using`
x =  rand(10) # x is a vector
plot(x)
scatter(x)
# ===================================


# ===================================
## CodeBlock 3.
n = 100 # 
ϵ = randn(n)
plot(1:n, ϵ)

# however we can do this in one line, however in julia there is no difference
# because of a concept known as inlining, we will come back to this later.
plot(randn(100))
# ===================================


# ===================================
## CodeBlock 4.
methods(rand)
# ===================================



# ===================================
## CodeBlock 5.
methods(rand)
# ===================================


# ===================================
## CodeBlock 6.
typeof(6)
typeof(6.0)
typeof("foo baz")
typeof(1:3)
typeof(1:2:10)
typeof('a')
typeof([1, 2, 3])
typeof(rand(2, 3))


x = 10 # x is a variable, 10 is the value
typeof(x) # the type is for the value NOT FOR THE VARIABLE 
# ==================================


# ===================================
## CodeBlock 7.
sizeof(3)
# ==================================


# ===================================
## CodeBlock 8.
supertype(Int64) # concrete type
supertype(Signed) # abstract supertype
supertype(Integer) # abstract supertype
supertype(Real) # abstract supertype
supertype(Number) # abstract supertype
supertype(Any) ## So Any is the father of every one in the hierarchy!

import Base.show_supertypes
show_supertypes(Int64)

# ================================== 


# ===================================
## CodeBlock 9.
subtype(Integer) ## there is no command call subtype because there are multiple children
subtypes(Integer) 
subtypes(Real)
# ================================== 


# ===================================
## CodeBlock 10.
using AbstractTrees # a package to show tree structues
AbstractTrees.children(x::Type) = subtypes(x) ## you will understand this later

 print_tree(Real)
# ================================== 


# ===================================
## CodeBlock 11.
function infect_again(p)
    r = rand()  
    return r < p
end
# ================================== 


# ===================================
## CodeBlock 12.
infect_again(0.3)

# we can also declare a variable and do this
x = 0.2
infect_again(x)
# ================================== 


# ===================================
## CodeBlock 13.
typeof(infect_again(0.3))
# ================================== 


# ===================================
## CodeBlock 14.
x = 0.4
data = infect_again(x)

data_integer = Int64(data)
typeof(data_integer)
# ================================== 


# ===================================
## CodeBlock 15.
"""
    infect_again(p)

retrun boolean type values for a given probability \$0 ≤ p ≤ 1\$

# Examples

julia> infect_again(0.2)
false

"""
function infect_again(p)
    r = rand()  
    return r < p
end
# ================================== 


# ===================================
## CodeBlock 16.

"a"*"a" # will concatenate
"a"+"a" # will throw an error.

x = "abncjakkkayl"

x[1] # it will return a character
x[begin] 
x[end]

x[end-1]

x[begin:2:end]
x[end-1:end]
# ================================== 


# ===================================
## CodeBlock 17.

infect_again(p) = rand() < p # same function, does exactly same thing, but more compact way of wrtiting
# ================================== 


# ===================================
## CodeBlock 18.

ϕ(x)  = ℯ^(-x^2)/2 # type \euler + <TAB>
# ================================== 


# ===================================
## CodeBlock 19.

# poor style
n = 100
ϵ = zeros(n) # by default it creates floating point 0 s
for i in 1:n
    ϵ[i] = randn()
end
# ================================== 



# ===================================
## CodeBlock 20.

# better style
n = 100
ϵ = zeros(n)
for i in eachindex(ϵ)
    ϵ[i] = randn()
end
# ================================== 



# ===================================
## CodeBlock 22.

ϵ
ϵ_sum = 0.0 # careful to use 0.0 here, instead of 0
m = 5
for ϵ_val in ϵ[1:m]
    ϵ_sum = ϵ_sum + ϵ_val # we can also use e_sum += eval
end
ϵ_mean = ϵ_sum / m
# ================================== 



# ===================================
## CodeBlock 23.

ϵ_mean ≈ sum(ϵ[1:m]) / m

# ================================== 


# ===================================
## CodeBlock 24.

n = 100
ϵ = zeros(n) # pre-allocation
x = for i in eachindex(ϵ)
    ϵ[i] = randn()
end
typeof(x)
# ================================== 



# ===================================
## CodeBlock 25.

3 + 3
+(3, 3)  ## operators are functions
+(3.0, 3.0)  
+(3.0, 3.5) 
# ================================== 


# ===================================
## CodeBlock 26.

@which +(3, 3) 
@which +(3, 3.0)
@which +(3.0, 3.0)
@which +(Int64(3), Int64(3))
# ================================== 


# ===================================
## CodeBlock 27.
convert(Int64, 2.0)
convert(Int64, 2.2) ## will throw an error
convert(AbstractFloat, "foo") ## will throw an error
# ================================== 



# ===================================
## CodeBlock 28.
promote(1, 3.0)
promote_type(Int64, Float64)
promote_type(BigInt, Float64)
# ================================== 



# ===================================
## CodeBlock 29.
@code_llvm 3 + 1
@code_llvm 3.0 + 1
@code_llvm 3.0 + 1.0
# ================================== 