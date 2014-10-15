class VotesController < ApplicationController
  #before_action :load_post_and_vote
  
 
  def up_vote
    voting(1)
  end

  def down_vote
    voting(-1)
  end

  private 
  
  def voting(x)
 	@post = Post.find(params[:post_id])

    @vote = @post.votes.where(user_id: current_user.id).first

    if @vote
      @vote.update_attribute(:value, x)
      authorize @vote, :update?
    else
       @vote = current_user.votes.build(value: x, post: @post)
       authorize @vote, :create?
       @vote.save
    end

    # http://apidock.com/rails/ActionController/Base/redirect_to
    redirect_to :back
  end
end