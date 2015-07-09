require 'sinatra'

def makeAcronym(string)
  if string.count("0-9") > 0
      "Not letters"
    else
      string.split.map{|word|word[0]}.join.upcase
  end
end

get "/" do
  erb :form
end

get "/react" do
  @reaction = makeAcronym(params[:text])
end