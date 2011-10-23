require 'test/unit'
require '../lib/coordinate'

class CoordinatesSpec < Test::Unit::TestCase
   def setup
      x, y = 2, 3
      @coordinate_object = Coordinate.new(x, y)
   end

   def test_get_x
      assert_equal(2, @coordinate_object.x)
   end

   def test_get_y
      assert_equal(3, @coordinate_object.y)
   end
end
