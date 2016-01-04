# lib/tic_tac_toe/core_extensions.rb
class Array
  def all_empty?
    self.all? { |element| element.to_s.empty? }
  end
end
