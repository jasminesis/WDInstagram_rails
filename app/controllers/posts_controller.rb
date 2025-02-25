class PostsController < ApplicationController
  def index
    if params[:sort_param] && params[:sort_order]
      @posts = Post.order("#{params[:sort_param]} #{params[:sort_order]}")
    else
      @posts = Post.all
    end 
  end

def show
    @post = Post.find(params[:id])
  end

def new
end

def edit
    @post = Post.find(params[:id])
  end

def create
    @post = Post.new(post_params)
  
    @post.save
    redirect_to @post
  end

  def update
    @post = Post.find(params[:id])
  
    @post.update(post_params)
    redirect_to @post
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  
    redirect_to root_path
  end
end

private
def post_params
params.require(:post).permit(:title, :author_name, :photo_url, :captions)
end
