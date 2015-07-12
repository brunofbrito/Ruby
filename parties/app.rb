require 'sinatra'
require 'time'

class Party

  attr_reader :id, :name, :description, :location, :date

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

  # def add_user(email)
  #   ...
  # end

  # def remove_user(email)
  #   ...
  # end

  # def attending_users_count
  #   ...
  # end
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