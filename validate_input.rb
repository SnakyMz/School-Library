def user_input(type)
  result = gets.chomp
  if type == 'int'
     result = result.to_i
  end
  result
end