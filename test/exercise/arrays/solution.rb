module Exercise
  module Arrays
    class << self
      def replace(array)
        max_value = array[0]
        array.each do |elem|
          max_value = elem if elem > max_value
        end
        array.map do |elem|
          elem = max_value if elem.positive?
          elem
        end
      end

      def search(array, value, array_border_begin = 0 , array_border_end = nil)
        return -1 if array.empty?

        array_begin = array_border_begin
        array_end = array_border_end || array.length - 1
        array_mid = (array_begin + array_end) / 2
        if value > array[array_end] || value < array[array_begin]
          -1
        elsif array[array_mid] == value
          array_mid
        elsif array[array_mid] > value
          search(array, value, array_begin, array_mid - 1)
        else
          search(array, value, array_mid + 1, array_end)
        end
      end
    end
  end
end
