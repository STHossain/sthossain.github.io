
#-----------------------------------
# CodeBlock1.
"Simulate a walk for `T` steps."
function walk(T)
    pos = initialize()
    
    trajectory = [pos]    # make a Vector that contains just the current value of `pos`
    
    for t in 1:T
        new_pos = move(pos)
        push!(trajectory, new_pos)   # append to the Vector
        
        pos = new_pos     # update for next iteration
    end
    
    return trajectory
end
#-----------------------------------



#-----------------------------------
# CodeBlock2.
?walk
#-----------------------------------


#-----------------------------------
# CodeBlock3.
walk(100)
#-----------------------------------


#-----------------------------------

# CodeBlock4.
initialize() = 0 ## note if we define init = 0, this will be a vriable, 
random_jump() = rand( (-1, +1) ) # tuple is a very efficient data structure, it is immutable!
move(x) = x + random_jump()
#-----------------------------------


#-----------------------------------
## CodeBlock5.
using BenchmarkTools

function tuple_check()
    for i = 1:100
        a = sum( (rand(Float64) for i = 1:10^2 ))
    end
end

@btime tuple_check()

## Ok my PC crashed! 

function array_check()
    for i = 1:100
        a = sum( [rand(Float64) for i = 1:10^2] )
    end
end

@btime array_check()

@btime begin
    (1, 2, 3)
end
# if you want to have the length of 100 tuple, 
Tuple( (rand(Float64) for i = 1:10^2 ) )

#-----------------------------------


#-----------------------------------
## CodeBlock6.
rand([1, -1])
rand( [-1, +1, 5])
#-----------------------------------



#-----------------------------------
# CodeBlock7.
# recall the old functions
# random_jump() = rand( (-1, +1) ) # generate +1 or -1 randomly
# move(x) = x + random_jump()'

@code_typed move(2)
#-----------------------------------


#-----------------------------------
# CodeBlock8.
walk(100)
#-----------------------------------


#-----------------------------------
# CodeBlock9.
walk(100)'
#-----------------------------------


#-----------------------------------
# CodeBlock10
using Plots ## you need to install Plots and then use it
using Random ## this package is pre-installed but you need to bring it
Random.seed!(6561); ## this will set the seed
plot(walk(100)) ## plot one random walk
plot!(walk(100)) ## plot another independent random walk
#-----------------------------------


#-----------------------------------
# CodeBlock11.
p = plot(legend=false)  # turn off the legend/key

for i in 1:10
    plot!(walk(100))  # plot! adds to the existing plot (modify existing plot)end
end


# so we need to run this
p

# or we can also (but not together)

plot!() # this will add nothing on the current plot
#-----------------------------------



#-----------------------------------
# CodeBlock12.
initialize_2D() = [0, 0]
move_2D(x) = [ x[1] + random_jump(), x[2] + random_jump() ]  # x is a vector
# we could write move_2D(x) = [ move(x[1]), move(x[2]) ] .. this would give us the same thing!
#-----------------------------------


#-----------------------------------
# CodeBlock13.
initialize_2D()
move_2D([0, 0])
#-----------------------------------


#-----------------------------------
# CodeBlock14.
"Simulate a walk for `T` steps."
function walk2D(T)
    pos = initialize_2D()
    
    trajectory = [pos]    # make a Vector that contains just the current value of `pos`
    
    for t in 1:T
        new_pos = move_2D(pos)
        push!(trajectory, new_pos)   # append to the Vector
        
        pos = new_pos     # update for next iteration
    end
    
    return trajectory
end

walk2D(100)
#-----------------------------------


#-----------------------------------
# CodeBlock15.
function walk(initialize, move, T)
    pos = initialize()
    
    trajectory = [pos]
    
    for t in 1:T
        pos = move(pos)               # *update* the value pointed to by `pos`
        push!(trajectory, deepcopy(pos))  # at the cost of needing to copy `pos` when we store it if it is a vector
    end
    
    return trajectory
end
#-----------------------------------


#-----------------------------------
# CodeBlock16.
methods(walk)
#-----------------------------------


#-----------------------------------
# CodeBlock 17,
trajectory = walk(initialize_2D, move_2D, 10)
#-----------------------------------


















