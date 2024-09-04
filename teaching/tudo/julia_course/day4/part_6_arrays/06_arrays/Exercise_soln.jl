

function score(x, y; outer = 10, middle = 5, inner = 1)
    z = √(x^2 + y^2)

    if 0 < inner < middle < outer 

        if z ≤ inner
            return 10
        elseif z ≤ middle
            return 5
        elseif z ≤ outer
            return 1
        else
            return 0
        end

    else
        begin
        throw(ArgumentError("argument must be nonnegative 
        and follow inner < middle < outer"))
        end
    end
    
end


randpoint_uniform()  = 20*rand() - 10


function scores_of_all_throws(number_of_throws)

    all_points = zeros(2, number_of_throws) ## pre-allocate a zero vector

    for i = 1:number_of_throws
        ## we are looping over the columns
        all_points[:, i] .= randpoint_uniform(), randpoint_uniform() ## why not array?? [  ]
    end

    scores = score.(all_points[1, :], all_points[2, :]) ## broadcast, generate two points
    
    return scores, all_points

end


scores, points = scores_of_all_throws(1000)








## Generic Programming with Darts


So we have this score function



function score(x, y; outer = 10, middle = 5, inner = 1)
    z = √(x^2 + y^2)

    if 0 < inner ≤ middle ≤ outer 

        if z ≤ inner
            return 10
        elseif z ≤ middle
            return 5
        elseif z ≤ outer
            return 1
        else
            return 0
        end

    else
        begin
        throw(ArgumentError("argument must be nonnegative and 
        follow inner <= middle <= outer"))
        end
    end
    
end




# function score(x, y)
#     z = √(x^2 + y^2)

#     if 0 < inner ≤ middle ≤ outer 

#         if z ≤ inner
#             return 10
#         elseif z ≤ middle
#             return 5
#         elseif z ≤ outer
#             return 1
#         else
#             return 0
#         end

#     else
#         throw(ArgumentError("argument must be nonnegative and follow inner <= middle <= outer"))
#     end
    
# end

randpoint_uniform()  = 20*rand() - 10
randpoint_normal() = randn()


# dist() =  20*rand() - 10

# number_of_throws = 10

function scores_of_all_throws( dist, number_of_throws  )

    all_points = zeros(2, number_of_throws)

    for i = 1:number_of_throws
        all_points[:, i] .= dist(), dist() ## why not array?? [  ]
    end
    scores = score.(all_points[1, :], all_points[2, :])
    
    return scores, all_points

end

scores, points = scores_of_all_throws(randpoint_uniform, 1000)
scores, points = scores_of_all_throws(randn, 1000)


using BenchmarkTools

@btime scores_of_all_throws(randpoint_uniform, 1000)
@code_warntype scores_of_all_throws(randpoint_uniform, 1000)






## Now let
struct DartboardThreeCircle
    outer::Float64
    middle::Float64
    inner::Float64
    DartboardThreeCircle(outer,middle,inner) = begin 
    0 < inner < middle < outer ? new(outer,middle,inner) : 
    throw(ArgumentError("argument must be nonnegative and follow inner < middle < outer"))
    end
end

# We can also create  dartboard 4 circle and so on... and supertype dartboards

d1 = DartboardThreeCircle(10,5,1) 



struct DartThrowerUniform
    a::Float64
    b::Float64
end


## I did without inner constructor
struct DartThrowerNormal
    μ::Float64
    σ::Float64
end

# struct DartThrowerNormal
#     μx::Float64
#     μy::Float64
#     σ::Float64
# end


dtu = DartThrowerUniform(10,10) ## initialize the 

dtn = DartThrowerNormal(5,10)

randpoint(dt::DartThrowerUniform) = 2*dt.a*rand() - dt.b, 2*dt.a*rand() - dt.b   ## this depends on the initialization 10, 10 for the uniform

randpoint(dt::DartThrowerNormal) = dt.σ*randn() + dt.μ,  dt.σ*randn() + dt.μ


randpoint(dtu)
randpoint(dtn)




## general score function
function score(x, y, d::DartboardThreeCircle)
    outer = d.outer
    middle = d.middle
    inner = d.inner

    z = √(x^2 + y^2)

    if 0 < inner ≤ middle ≤ outer 

        if z ≤ inner
            return 10
        elseif z ≤ middle
            return 5
        elseif z ≤ outer
            return 1
        else
            return 0
        end

    else
        throw(ArgumentError("argument must be nonnegative and follow inner <= middle <= outer"))
    end
    
end

d1 = DartboardThreeCircle(10,5,1) 
score(1, 2, d1)

## 





## initialize dart thrower




# abstract type DartThrower end


# struct DartThrowerUniform 
#     a::Float64
#     b::Float64
# end

# struct DartThrowerNormal 
#     μ::Float64
#     σ::Float64
# end


dtu = DartThrowerUniform(10,10) ## initialize the thrower
dtn = DartThrowerNormal(0,10)



function scores_of_all_throws(dart_thrower, number_of_throws, dartboard)

    all_points = zeros(2, number_of_throws)
    scores = zeros(number_of_throws)

    for i = 1:number_of_throws
        all_points[:, i] .=  randpoint(dart_thrower) ## why not array?? [  ]
        scores[i] = score(all_points[1, i], all_points[2, i], dartboard)
    end
    
    return scores, all_points

end



scores, points = scores_of_all_throws(dtu, 10, d1)











nothing