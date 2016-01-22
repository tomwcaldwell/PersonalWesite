class BlogsController < ApplicationController
  
	before_action :set_blog, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_admin!, except: [:index, :show]

  def index
  	 @blogs = Blog.paginate(page: params[:page], per_page: 5).order("created_at DESC")
  end

  def new
  	@blog = current_admin.blogs.build
  end

  def create
  	@blog = current_admin.blogs.build(blog_params)
  	if @blog.save
  		flash[:notice] = "Blog was created successfully!"
  		redirect_to blog_path(@blog)
  	else
  		render 'new'
  	end
  end

  def show
  end

  def edit
  end

  def update
  	if @blog.update(blog_params)
  		flash[:notice] = "Blog was successfully updated!"
  		redirect_to blog_path(@blog)
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@blog.destroy
  	flash[:notice] = "'#{@blog.title}' was successfully deleted!"
  	redirect_to blogs_path
  end

  private

  	def set_blog
  		@blog = Blog.find(params[:id])
  	end

  	def blog_params
  		params.require(:blog).permit(:title, :image, :content)
  	end

end
