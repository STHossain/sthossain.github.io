using Plots 
gr()
function circleGen(h, k, r)
    θ = LinRange(0, 2π , 500)
    h .+ r*sin.(θ), k .+ r* cos.(θ)
end


"""
Draws a 3-circle-dartboard with radii of the circles given by `outer` , `middle`, `inner`. It will only work correctly if `outer > middle > inner > 0`, otherwise it may not works as expected

For example, `da`
"""
function draw_mydartboard(outer = 10, middle = 5, inner =1; axis = true)
    plot(Shape([(10,10),(10,-10),(-10,-10),(-10,10)]),linewidth = 3,  aspect_ratio = 1 , size = (500,500),grid = axis, axis=axis, leg = false, fillcolor = :yellow, linecolor = :green, fillalpha = 0.2)
    plot!(circleGen(0,0,outer), seriestype = [:shape], linewidth = 3, fillcolor = :firebrick,  leg = false,xticks = [outer , middle, inner, 0, -outer , -middle, -inner],  yticks = [outer , middle, inner, 0, -outer , -middle, -inner])
    plot!(circleGen(0,0,middle), linewidth = 3, seriestype = [:shape], fillcolor = :royalblue4,  leg = false)
    plot!(circleGen(0,0,inner), linewidth = 3,seriestype = [:shape], fillcolor = :white, leg = false)

end

#draw_mydartboard(10 ,5, 1)


"""
Draws points on 2D dartboard, must draw the dartboard first. Firsr argument should be x coordinates and second argument should be y coordinates
"""
throw_darts_on_board(xs,ys) = scatter!(xs,ys, markersize = 5, markershape = :star5, linewidth = 3,c = :aquamarine)

function score_histogram(data)
    histogram(data,  
        bins = (minimum(data)-0.5:1:maximum(data)+0.5), 
        bar_width = .3,         xticks=[0, 1, 5, 10], legend = false, xlims = [-1:11])
end

nothing