class Square
    def initialize(x, y, parent=nil)
        @x = x
        @y = y
        @children = []
        @parent = parent
    end

    def create_children
        potentials = []
        potentials.push(
            [board.x + 2, board.y + 1],
            [board.x + 2, board.y - 1],
            [board.x + 1, board.y + 2],
            [board.x + 1, board.y - 2],
            [board.x - 2, board.y + 1],
            [board.x - 2, board.y - 1],
            [board.x - 1, board.y + 2],
            [board.x - 1, board.y - 2],
        )
        valid_children = potentials.select do |space|
            space[0].between?(0, 8) && space[1].between?(0, 8)

        end

        valid_children = valid_children.map do |space|
            Square.new(space[0], space[1], board)
        end

        @children = valid_children
    end
end

def display_path(current)
    parent = current.parent
    array = []
    while !parent.nil?
        array << [parent.x, parent.y]
        parent = parent.parent
    end
    array.reverse!
    array << [current.x, current.y]
    puts "Your path is: "
    array.each { |i| p i }
end