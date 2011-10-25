class Cell
   def initialize coordinate
      @coordinate = coordinate
      @alive = false
   end

   def alive?
      @alive
   end

   def kill
      @alive = false
   end

   def live
      @alive = true
   end

   def get_coordinate
      @coordinate
   end

   def to_s
      "Cell: alive = #{@alive}, coordinate = #{@coordinate}"
   end
end
