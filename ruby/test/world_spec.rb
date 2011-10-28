require 'test/unit'
require '../lib/cell'
require '../lib/coordinate'
require '../lib/world'

class WorldSpec < Test::Unit::TestCase
   def setup
      @coordinates = [Coordinate.new(0, 0), Coordinate.new(0, 1), Coordinate.new(1, 0)]
      @cell1 = Cell.new(@coordinates[0])
      @cell1.live
      @cell2 = Cell.new(@coordinates[1])
      @cell2.live
      @cell3 = Cell.new(@coordinates[2])
      @cell3.live
      @world = World.new([@cell1, @cell2, @cell3])
   end

   def test_live_neighbours
      assert_equal(2, @world.get_live_neighbour_count(@cell1))
      assert_equal(2, @world.get_live_neighbour_count(@cell2))
      assert_equal(2, @world.get_live_neighbour_count(@cell3))
   end

   def test_next_generation_is_block
      @world.next_generation
      assert_equal(3, @world.get_live_neighbour_count(@cell1))
      assert_equal(3, @world.get_live_neighbour_count(@cell2))
      assert_equal(3, @world.get_live_neighbour_count(@cell3))
      @world.next_generation
      assert_equal(3, @world.get_live_neighbour_count(@cell1))
      assert_equal(3, @world.get_live_neighbour_count(@cell2))
      assert_equal(3, @world.get_live_neighbour_count(@cell3))
      @world.next_generation
      assert_equal(3, @world.get_live_neighbour_count(@cell1))
      assert_equal(3, @world.get_live_neighbour_count(@cell2))
      assert_equal(3, @world.get_live_neighbour_count(@cell3))
   end

end
