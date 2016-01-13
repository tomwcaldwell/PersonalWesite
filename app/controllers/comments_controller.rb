class CommentsController < ApplicationController

	before_action :set_comment, only: [:destroy]

	def create
		@blog = Blog.find(params[:blog_id])
		@comment = @blog.comments.create(comment_params)
		redirect_to blog_path(@blog)
	end

	def destroy
		@comment.destroy
  		flash[:notice] = "Comment was successfully deleted!"
  		redirect_to blogs_path
	end

	private

		def set_comment
  			@comment = Comment.find(params[:id])
  		end

		def comment_params
			params.require(:comment).permit(:commenter, :body)
		end
end
