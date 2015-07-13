# Parties are cool. But now you need to know how many people are joining. Change the existing party class to allow you to insert and remove attending users.
# Create a form on the party page that allows user to indicate that they're going by entering their email. Also, add a list of already going users and a button to allow remove a user.
# Make sure the emails are unique.
# Add a counter on the parties list page indicating the number of attending users.

require 'sinatra'
require 'time'

class Party

  attr_reader :id, :name, :description, :location, :date, :users

  def initialize(hash)
    @id = hash[:id]
    @name = hash[:name]
    @description = hash[:description]
    @location = hash[:location]
    @date = hash[:date]
    @users = []
  end

  def change_name(name)
    @name = name
  end

  def add_user(email)
    @users << email
  end

  def remove_user(email)
    @users.delete_if { |a| a == email }
  end

  def attending_users_count
    @users.size
  end

  def email_unique?(email)
    @users.include?(email)
  end

end

parties = [
  Party.new({ id: 0, name: "The freaks come out", description: "If you are a freak and you want to dance until the sun comes up, this is the place to be!", location: "Lisboa", date: "2014-07-15" }),
  Party.new({ id: 1, name: "From Dusk till Dawn", description: "Are you looking for a sleepless night? Well, look no further!", location: "Porto", date: "2015-07-15" }),
  Party.new({ id: 2, name: "Summer Beach Party 2015", description: "You like dancing in the sand, don't you?", location: "Faro", date: "2016-09-15" })
]

get '/' do
  if params[:order] == "ascending"
    @parties = parties.sort_by {|party| party.name}
  elsif params[:order] == "descending"
    @parties = parties.sort_by {|party| party.name}.reverse
  else
    @parties = parties.select do |party|
      Time.parse(party.date) > Time.now
    end
  end
  erb :index
end

get '/show/:id' do
  @party = parties.find do |party|
    party.id == params[:id].to_i
  end
  erb :show
end

get '/edit/:id' do
  @party = parties.find do |party|
    party.id == params[:id].to_i
  end
  erb :edit
end

post '/edit/:id' do
  party = parties.find do |party|
    party.id == params[:id].to_i
  end
  party.change_name(params[:name])
  redirect '/'
end

get '/create' do
  erb :create
end

post '/create' do
  parties << Party.new({:id => parties.length, :name => params[:name], :description => params[:description], :location => params[:location], :date => params[:date]}) 
  @parties = parties
  redirect '/'
end

get '/remove/:id' do
  @party_deleted = parties.delete_if{|party| party.id == params[:id].to_i}
  # OU @party_deleted = parties.delete_at(params[:id].to_i)
  redirect '/'
end

post '/filter' do
  @results = parties.select do |party|
    party.name.include?(params[:filter]) || party.description.include?(params[:filter])
  end
  erb :search_results
end

post '/add_user/:id' do
    parties.each do |party|
    party.id == params[:id]
    party.add_user(params[:email])
  end
  redirect "/show/#{params[:id]}"
end

get '/remove_user/:id/:user' do
  parties.each do |party|
  party.id == params[:id]
    party.remove_user(params[:user])
  end
  redirect "/show/#{params[:id]}"
end

# username = 'gabrielpoca'
# password = '123456'

# get '/parties/new' do
#   if params[:username] != username || params[:password] != pasword
#     @error_message = 'Wrong credentials'
#     erb :form
#   else
#     parties << Party.new ...
#     redirect '/'
#   end
# end