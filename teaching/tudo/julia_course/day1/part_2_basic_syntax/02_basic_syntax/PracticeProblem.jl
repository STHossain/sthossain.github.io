


# Practice Problem 1.



# Question 1. Write a function which will check following 3 conditions

# - a. Whether any number is divisable by 2 and not by 3
# - b. Whether any number is divisible by 3 and not by 3
# - c. Whether any number is divisible by 2 and 3 

# (Hint: It is a simple if else condition check function. To check the divisibility you can use the remainder operator `%`, e.g., if `x` is divisible by `5` then it means `x % 5 == 0`.)


### Solutions 


function divisible_two_three(x)
    if x % 2 == 0
        if x % 3 == 0
            println("Divisible by 2 and 3")
        else
            println("Divisible by 2 and not by 3")
        end
    elseif x % 3 == 0
        println("Divisible by 3 and not by 2")
    else 
        println("Neither divisible by 3 nor by 2")
    end
end


# You can check whether your function is working like this

# julia> divisible_two_three(21.3)
# Neither divisible by 3 nor by 2

# julia> divisible_two_three(5)
# Neither divisible by 3 nor by 2

# julia> divisible_two_three(21)
# Divisible by 3 and not by 2

# julia> divisible_two_three(6)
# Divisible by 2 and 3

# julia> divisible_two_three(26)
# Divisible by 2 and not by 3

# julia> divisible_two_three(0)
# Divisible by 2 and 3







# Question 2. Write a function which will take any string and will count the number of vowels in the string in English (You already know but the vowels, and they are:  `a, e, i, o, u`)


function count_vowels(s)
    count = 0
    for vowel in s
        if vowel ∈ ['a', 'e', 'i', 'o', 'u']
            count += 1
        end
    end
    println("The number of vowels is $count")
end

count_vowels("laslkasas")
count_vowels("laksaksasklas")
count_vowels("ooiiuubbnnmmzddssgghhaqwweellaakkjja")


# Question 3. Write a function such that for any vector of integers, it should return the total number of integers between 0 to 9.
  
function count_ints(x)
    numbs_0_9 = collect(0:9)
    count = sum([i ∈ numbs_0_9 for i in x])
end

x = [1, 3, 4, 5]
count_ints(x)

x = [1, 3, 44, 6, 88, 101]
count_ints(x)


# Question 4. Write a function `find_cube_root(x)` which will only accept integer $x$ and find the integer cube root. In other words, if $x$ is a perfect cube it will return the cube root. If $x$ is not a perfect cube, then it will print it is not. 


function find_cube_root(x::Integer)
    root = 0
    while root^3 < abs(x)
        root += 1
    end
    #
    if root^3 != abs(x)
        println("$x is not a perfect cube")
    elseif x < 0
        root = - root
        println("The cube root of $x is $root")
    else 
        println("The cube root of $x is $root")
    end
end 


find_cube_root(12)
find_cube_root(8)
find_cube_root(9)
find_cube_root(27)



# Question 5: Prime number 


function primes_to(n)

    ## a is the marking array, which has 1,  the index can be thought as 1, 2, ...., n
    a = fill(true, n)
    a[1] = false  ## set first 1 is 0, since 1 is not a prime
    
    p = 2 #start from 2
    
    while p ≤ n 
        if a[p] == true
            j = 2p
            while j ≤ n
                a[j] = false # make all the multiples of p false
                j = j + p # increment by p becaus we want the multiples of p
            end
        end
    
        p = p + 1
    end
    return findall(a) 
end

primes_to(10)'
primes_to(20)'
primes_to(5)'



function primes_to_refine(n)

    a = fill(true, n) ## the index can be thought as 1, 2, ...., n
    a[1] = false  ## since 1 is not a prime number, 
                            ## the first one is false
    
    p = 2
    
    while p ≤ √n #refinement 1:when p^2 = n, all remaining nonprimes are already marked
        if a[p] == true
            j = p^2 #refinement 2: it is enough to do the marking from p^2
            while j ≤ n
                a[j] = false
                j = j + p # increment by 
            end
        end
    
        p = p + 1
    end
    return findall(a)
end

using BenchmarkTools
@btime primes_to_refine(100000)'
@btime primes_to(100000)'