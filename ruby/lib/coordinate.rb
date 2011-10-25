class Coordinate
   attr_accessor :x, :y

   def initialize x, y
      @x, @y = x, y
   end

   def hash
      [@x,@y].hash
   end

   def eql? other
      true if @x==other.x && @y==other.y
   end

   def to_s
      "Coordinate: x = #{@x} and y = #{@y}"
   end
end
