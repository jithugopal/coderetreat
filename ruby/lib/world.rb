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
         tn = traverse_neighbours(cell)
         temp_hash.merge(tn)
      end
      temp_hash
   end

   def traverse_neighbours cell
      temp_hash = Hash.new
      x, y = cell.get_coordinate.x, cell.get_coordinate.y
      [x-1, x, x+1].each { |xc|
         [y-1, y, y+1].each { |yc|
            if xc == x && yc == y
               next
            end
            neighbour_cell = Cell.new(Coordinate.new(xc,yc))
            if should_cell_live? neighbour_cell
               neighbour_cell.live
               temp_hash[neighbour_cell.get_coordinate] = neighbour_cell
            end
         }
      }
      temp_hash
   end

   def should_cell_live? cell
      if cell.alive?
         if get_live_neighbour_count(cell) < 2 || get_live_neighbour_count(cell) > 3
            return false
         end
      else
         if get_live_neighbour_count(cell) != 3
            return false
         end
      end
      true
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
