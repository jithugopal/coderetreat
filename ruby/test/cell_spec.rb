require 'test/unit'
require '../lib/cell'
require '../lib/coordinate'

class CellSpec < Test::Unit::TestCase
   def setup
      @x, @y = 2, 3
      @coordinate = Coordinate.new(@x, @y)
      @cell = Cell.new(@coordinate)
   end

   def test_if_alive
      assert_equal(false, @cell.alive?)
   end

   def test_if_living
      @cell.live
      assert_equal(@cell.alive?, true)
   end

   def test_if_killed
      @cell.kill
      assert_equal(@cell.alive?, false)
   end

   def test_coordinate
      assert_equal(@coordinate, @cell.get_coordinate)
   end
end
