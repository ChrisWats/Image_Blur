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

    @image.each_index do |line|
      subarray = @image[line]
      
      subarray.each_index do |i|
        if self.check_one(@image[line][i]) 
            # Change the 0 to the left into a 1.
             if i != 0
              temp[line][i - 1] = 1
             end
            
            # Change the 0 to the right into a 1.
             if i != (subarray.length - 1)
              temp[line][i + 1] = 1
             end
            
            # Change the 0 below into a 1.
             if i != (subarray.length)
              temp[line + 1][i] = 1
             end
            

            # Change the 0 above into a 1.
             if line != 0
              temp[line - 1][i] = 1
             end
        end
      end
    end
    puts "Temp is #{temp}"
    puts "image is #{@image}"
    @image = temp
  end

  def check_one(i)
    # Check for a 1 in an array
    return i == 1
  end
end

image = Image.new([[0, 0, 0, 0], [0, 1, 0, 0], [0, 0, 0, 1], [0, 0, 0, 0]])
image.transform
image.output_image