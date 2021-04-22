class CommentsController < ApplicationController



  def create
    @comment = Comment.new(comment_params)
    @message = Message.find(params[:message_id])
    @comment.message = @message
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to message_path(@message)
    else
      render 'message/show'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to message_path(@comment.message)
  end


  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
