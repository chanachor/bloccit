class CommentsController < ApplicationController

  def create
    #@topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post
    authorize @comment
    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving this post. Please try again. "
      redirect_to [@topic, @post]
    end
  end

  def destroy
    #@topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = @post.comments.find(params[:id])
    

    authorize @comment
    
    if @comment.destroy
      flash[:notice] = "Comment is deleted successfully"
      redirect_to [@topic, @post]
    else
      flash[:error] = "Error deleting comment."
      redirect_to [@topic, @post]
    end
  end


private

def comment_params
    params.require(:comment).permit(:body)
end

end
