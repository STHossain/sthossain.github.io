




struct Walker2D 
    x::Int64 ## x is a field
    y::Int64 ## y is a field
end

# move(w::Walker2D) = Walker2D(w.x + rand((1, -1)),  w.y + rand((1, -1)))

function walk(w, T)
    
    trajectory = [w]   # store the current (initial) position of `w`
    
    for t in 1:T
        w = move(w)    # update the value bound to `w`
        push!(trajectory, deepcopy(w))   # store the current value
    end
    
    return trajectory
end


move(w::Walker2D) = w.x + rand((1, -1)),  w.y + rand((1, -1))


w2d = Walker2D(5, 0)
w2d = move(w2d) ## run two times....you would see the problem

walk(w2d, 5) ## Walk will also fail on this move



# So we need the following move, so that it works nicely 
## everytime we call move on the loop!

move(w::Walker2D) = Walker2D(w.x + rand((1, -1)),  w.y + rand((1, -1)))

 
# But for defining a methods, previous move is fine, but it returns 
# a tuple and then in the next time we cannot move again!


## And since we cannot apply the move function on Tuple, we need Walker2D
## constructor....???



