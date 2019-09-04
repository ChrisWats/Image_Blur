class Image
  attr_accessor :image

  def initialize(image)
    @image = image
  end

  def output_image
    string = ""
    @image.each_index do |line|
      subarray = @image[line]
      subarray.each_index do |i|
        string = string + @image[line][i].to_s
      end
      puts string
      string = ""
    end
  end

end

image = Image.new([[0, 0, 0, 0], [0, 1, 0, 0], [0, 0, 0, 1], [0, 0, 0, 0]])
image.output_image