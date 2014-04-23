class CommentsController < ApplicationController


  # before_filter :signed_in_user
  # before_filter :correct_user, only: :destroy

  def create
    @comment_hash = params[:comment]
    @obj = @comment_hash[:commentable_type].constantize.find(@comment_hash[:commentable_id])
    @comment = Comment.build_from(@obj, current_user.id, @comment_hash[:body])
    if @comment.save
      render :partial => "comments/comment", :locals => { :comment => @comment }, :layout => false, :status => :created
    else
      render :js => "alert('error saving comment');"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    # if @comment.user_id == current_user.id
      if @comment.destroy
        render :json => @comment, :status => :ok
      else
        render :js => "alert('error deleting comment');"
      end
    # end
  end

  # private

  #   def comment_params
  #     params.require(:comment).permit(:content)
  #   end

  #   def correct_user
  #     @comment = current_user.comments.find_by(id: params[:id])
  #     redirect_to root_url if @comment.nil?
  #   end

end
