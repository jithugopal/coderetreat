class World
   def initialize cells
      @live_cells = {}
      @new_live_cells = {}
      cells.map do |cell|
         @live_cells[cell.get_coordinate] = cell
      end
   end

   def next_generation
      @live_cells.each do |coordinate, cell|
         traverse_neighbours(cell)
      end
      @live_cells = @new_live_cells.clone
      @new_live_cells={}
   end

   def traverse_neighbours cell
      x, y = cell.get_coordinate.x, cell.get_coordinate.y
      [x-1, x, x+1].each { |xc|
         [y-1, y, y+1].each { |yc|
            neighbour_coordinate = Coordinate.new(xc, yc)
            neighbour_cell = Cell.new(neighbour_coordinate)

            if @live_cells.has_key? neighbour_coordinate
               neighbour_cell.live
            end

            if should_cell_live? neighbour_cell
               neighbour_cell.live
               @new_live_cells[neighbour_cell.get_coordinate] = neighbour_cell
            end
         }
      }
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
            if @live_cells.has_key?(Coordinate.new(xc, yc))
               neighbour_count += 1 unless xc == x && yc == y
            end
         }
      }
      neighbour_count
   end

   def status
      @live_cells
   end
end
