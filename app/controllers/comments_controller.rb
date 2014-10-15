class CommentsController < ApplicationController
	def create
    #@topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comments = @post.comments

    @comment = current_user.comments.build(comment_params)
    @comment.post = @post

     authorize @comment

     if @comment.save
       flash[:notice] = "Comment was saved."
       redirect_to [@post.topic, @post]
     else
       flash[:error] = "There was an error saving the comment. Please try again."
       render :new
     end
     
   end

   def destroy
     @post = Post.find(params[:post_id])
     @comment = @post.comments.find(params[:id])
 
     authorize @comment
     if @comment.destroy
       flash[:notice] = "Comment was removed."
       redirect_to [@post.topic, @post]
     else
       flash[:error] = "Comment couldn't be deleted. Try again."
       redirect_to [@post.topic, @post]
       #redirect_to topic_post_url(@post.topic, @post)
     end
   end

   def comment_params
       params.require(:comment).permit(:body)
   end
end
