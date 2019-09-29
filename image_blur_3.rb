class Image
  attr_accessor :image

  def initialize(image)
    @image = image
  end

  def output_image
    @image.each do |line|
      puts self.string_array(line)
    end
  end

  def string_array(array)
    string = ""

    array.each do |i|
      string += i.to_s
    end
    return string
  end

  def transform
    # Takes the image and changes a 0 next to a 1 into a 1.
    temp = []
    @image.each do |e| 
      temp << e.dup
    end

    offsets = [
      [-1,0], # pixel to the left (x-1, y-0)
      [0,-1], # pixel above (x-0, y-1)
      [1,0], # pixel to the right (x+1, y+0)
      [0,1] #pixel below (x+0, y+1)
    ]


    @image.each_index do |x|
      subarray = @image[x]
      
      subarray.each_index do |y|
        if self.check_one(@image[x][y]) 
          offsets.each do |offset|
            if x + offset[0] >= 0 && y+offset[1] >= 0 && x+offset[0] < subarray.length && y+offset[1] < @image.length
              temp[x+offset[0]][y+offset[1]] = 1
            end
          end
        end
      end
    end
    @image = temp
  end

  def check_one(i)
    # Check for a 1 in an array
    return i == 1
  end

  def blur(distance)
    # This method will implement a blurring of the Manhattan distance specified.
    
    # if distance.to_i.to_s == distance # Verify it is an integer
      distance.to_i.times do
        self.transform
      end
    # end
  end
end

# Original test with user input for distance.
# image = Image.new([[0, 0, 0, 0], [0, 1, 0, 0], [0, 0, 0, 1], [0, 0, 0, 0]])
# puts "Before"
# image.output_image
# puts "enter integer:"
# image.blur(gets.chomp)
# puts "After"
# image.output_image

# Blur1 test comparing to sample blur1 results in image blur 3 challenge document.
# blur1 = Image.new([[0, 0, 0, 0], [0, 1, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]])
# puts "Blur(1) Before"
# blur1.output_image
# blur1.blur(1)
# puts "Blur(1) After"
# blur1.output_image

# Blur2 test comparing to sample blur1 results in image blur 3 challenge document.
# blur2 = Image.new([[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 1, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]])
# puts "Blur(2) Before"
# blur2.output_image
# blur2.blur(2)
# blur2.transform
# puts "Blur(2) After"
# blur2.output_image

# Blur3 test comparing to sample blur1 results in image blur 3 challenge document.
blur3 = Image.new([[0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 1, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 1]])
puts "Blur(3) Before"
blur3.output_image
# blur3.blur(3)
blur3.transform
puts "Blur(3) After"
blur3.output_image