require 'sinatra'

def allowed_to_drink(age)

  if age.empty?
    "Error: Age not provided."
  elsif age.to_i < 18
    "You are #{age}, so you are not allowed to drink."
  else 
    "You are #{age}, so you are allowed to drink."
  end
end

get '/' do
  erb :form
end

get "/ageresponse" do
  @response_age = allowed_to_drink(params[:age])
  erb :ageresponse
end