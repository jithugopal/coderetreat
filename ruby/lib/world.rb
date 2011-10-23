class World
   def initialize cells
      @live_cell_hash = {}
      cells.map do |cell|
         @live_cell_hash[cell.get_coordinate] = cell
      end
   end

   def next_generation
      temp_hash = Hash.new
      @live_cell_hash.each do |coordinate, cell|
         temp_hash[cell.get_coordinate] = cell if should_cell_live? cell
         puts tn = traverse_neighbours(cell)
         temp_hash.merge(tn)
      end
      temp_hash
   end

   def should_cell_live? cell
      if cell.alive?
         if get_live_neighbour_count(cell) < 2 || get_live_neighbour_count(cell) > 3
            false
         end
      else
         if get_live_neighbour_count(cell) != 3
            false
         end
      end
      true
   end

   def traverse_neighbours cell
      temp_hash = Hash.new
      x, y = cell.get_coordinate.x, cell.get_coordinate.y
      [x-1, x, x+1].each { |xc|
         [y-1, y, y+1].each { |yc|
            if @live_cell_hash.has_key?(Coordinate.new(xc, yc))
               neighbour_cell = Cell.new(Coordinate.new(xc, yc))
               if should_cell_live? neighbour_cell
                  temp_hash[neighbour_cell.get_coordinate] = neighbour_cell unless xc == x && yc == y
               end
            end
         }
      }
      temp_hash
   end

   def get_live_neighbour_count cell
      x, y = cell.get_coordinate.x, cell.get_coordinate.y
      neighbour_count = 0
      [x-1, x, x+1].each { |xc|
         [y-1, y, y+1].each { |yc|
            if @live_cell_hash.has_key?(Coordinate.new(xc, yc))
               neighbour_count += 1 unless xc == x && yc == y
            end
         }
      }
      neighbour_count
   end
end

=begin
coordinates = [Coordinate.new(0, 0), Coordinate.new(0, 1), Coordinate.new(1, 0)]
cell1 = Cell.new(coordinates[0])
cell1.live
cell2 = Cell.new(coordinates[1])
cell2.live
cell3 = Cell.new(coordinates[2])
cell3.live
world = World.new([cell1, cell2, cell3])
puts world.next_generation
=end
