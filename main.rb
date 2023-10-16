class Square
    def initialize(x, y, parent=nil)
        @x = x
        @y = y
        @children = []
        @parent = parent
    end
end