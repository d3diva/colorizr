class String
  #constant for colors code
  COLORS = {red: 31, green: 32, yellow: 33,
              blue: 34, pink: 35,light_blue: 94,
              white: 97, light_grey: 37,black: 30}

  # generats all colors methods
  def self.create_colors
    COLORS.each do |color, code|
      self.send(:define_method, "#{color}") do
        "\e[#{code}m" + self + "\e[0m"
      end
    end
  end

  # returns all colors options
  def self.colors
    COLORS.keys
  end

  #prints sample output demonstrating all the colors
  def self.sample_colors
    colors.each { |color| puts "This is " + "#{color}".send(color) }
  end

  String.create_colors

end
