# Só devolver os pares
def no_odds(values)
  even_values = []
  values.each do |value|
    if value.even?
      even_values << value
    end
  end
  even_values
end

p no_odds([4,7,8,16])