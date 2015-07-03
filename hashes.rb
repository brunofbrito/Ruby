def translate(lang)
  languages = {
    :de => 'German',
    :en => 'English',
    :es => 'Spanish',
  }

  dictionary = {
    :de => { :one => 'eins', :two => 'zwei', :three => 'drei'},
    :en => { :one => 'one', :two => 'two', :three => 'three'},
    :es => { :one => 'uno', :two => 'dos', :three => 'tres'}
  }
    "In #{languages[lang]}, #{dictionary[lang][:one]} means one, #{dictionary[lang][:two]} means two, #{dictionary[lang][:three]} means three."
end

# In German, eins means one, zwei means two, drei means three
# In Spanish, uno means one, dos means two, tres means three

puts translate(:de)
puts translate(:es)