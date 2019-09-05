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

end

image = Image.new([[0, 0, 0, 0], [0, 1, 0, 0], [0, 0, 0, 1], [0, 0, 0, 0]])
image.output_image