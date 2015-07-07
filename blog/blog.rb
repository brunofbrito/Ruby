require 'sinatra'

class Post

  attr_reader :id, :title, :body, :author, :created_at

  def initialize(id, title, body, author, created_at)
    @id = id
    @title = title
    @body = body
    @author = author
    @created_at = created_at
  end

  def to_s
    "Post no: #{@id} - #{@title}"
  end

end

class Comment

  attr_reader :post_id, :body, :author, :id

  def initialize(id, body, author, post_id)
    @id = id
    @body = body
    @author = author
    @post_id = post_id
  end

end

posts = [
  Post.new("1","Primeiro Artigo","Este é o meu primeiro artigo, para ver o que acontece.","Bruno","5 de Julho"),
  Post.new("2","Segundo Artigo","Este é o meu segundo artigo, para outro teste.","Bruno","6 de Julho")
]

comments = [
  Comment.new("1", 'I really like this post', 'Gabriel', "1"),
  Comment.new("2", 'Awesome, thanks!', 'Bruno', "2"),
  Comment.new("3", 'Unbelievable piece of content', 'Sara', "1"),
  Comment.new("4", 'Best article ever!', 'Eric', "1")
]

get '/' do
  @posts = posts
  erb :index
end

get '/show/:id' do
  @post = posts.find do |post|
    post.id == params[:id]
  end
  @comment = comments.select do |comment|
    comment.post_id == @post.id
  end
  erb :show
end