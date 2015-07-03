#input one two three
#output <ul><li>one</li>li>two</li>li>three</li></ul>

# ary = ["one", "two", "three", "four", "five"]

# def bullet(ary)
#   output = "<ul>"
#   ary.each do |item|
#   print "<li>#{item}</li>"
#   end
#   output << "</ul>"
# end

# puts bullet(ary)

# SOLUÇÃO DA AULA

def html_list(items)
  text = "<ul>\n"
  items.each do |item|
    text  << "\t<li>#{item}</li>\n"
  end
  text << "</ul>"
end

output = html_list(ARGV)

puts output