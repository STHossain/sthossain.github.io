


### Exercises!


# #-----------------------------------
# # CodeBlock1.
# "Simulate a walk for `T` steps."
# function walk(T)
#     pos = initialize()
    
#     trajectory = [pos]    # make a Vector that contains just the current value of `pos`
    
#     for t in 1:T
#         new_pos = move(pos)
#         push!(trajectory, new_pos)   # append to the Vector
        
#         pos = new_pos     # update for next iteration
#     end
    
#     return trajectory
# end
# #-----------------------------------

initialize() = 0 ## note if I define init = 0, this will be a vriable,
random_jump() = rand( (-1, +1) ) # generate +1 or -1 randomly
move(x) = x + random_jump()'




pos_w1 = initialize()
pos_w2 = initialize(2)

# for error we need a new method
initialize(x) = x

pos_w1 = initialize()
pos_w2 = initialize(2)


trajectory1 = [pos_w1]
trajectory2 = [pos_w2]

count_steps = 0

while pos_w1 != pos_w2
    count_steps += 1
    pos_w1 = move(pos_w1)
    pos_w2 = move(pos_w2)
    push!(trajectory1, pos_w1)
    push!(trajectory2, pos_w2)
end

plot(trajectory1)
plot!(trajectory2)



times = Int64[]


for i = 1:10
    
    pos_w1 = initialize()
    pos_w2 = initialize(2)
    
    count_steps = 0

    while pos_w1 != pos_w2
        count_steps += 1
        pos_w1 = move(pos_w1)
        pos_w2 = move(pos_w2)
    end

    push!(times, count_steps)

end

histogram(times, bins = 10, normed = false)



function f()

    times = Int64[]
    sizehint!(times, 1000)

    for i = 1:10^6
        pos_w1 = initialize()
        pos_w2 = initialize(2)

        # trajectory1 = [pos_w1]
        # trajectory2 = [pos_w2]
        
        count_steps = 0

        while pos_w1 != pos_w2
            count_steps += 1

            if pos_w1 == -20 
                pos_w1 += 1 
            elseif pos_w1 == 20
                pos_w1 -= 1
            else 
                pos_w1 = move(pos_w1)
            end

            
            if pos_w2 == -20 
                pos_w2 += 1 
            elseif pos_w2 == 20
                pos_w2 -= 1
            else 
                pos_w2 = move(pos_w2)
            end
            
            # push!(trajectory1, pos_w1)
            # push!(trajectory2, pos_w2)

        end

        push!(times, count_steps)   
    end
    return times
end


plot(trajectory1)
plot!(trajectory2)




histogram(times, bins = 10, normed = false)





