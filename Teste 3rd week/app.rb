require 'sinatra'

class Calculator
  def initialize(x, y = 0)
    @x = x
    @y = y
  end

  def sum
    @x + @y
  end
end

get '/sum' do
  Calculator.new(params[:x], params[:y]).sum
end

get '/sum/1/2' do
  Calculator.new(5,7).sum
end