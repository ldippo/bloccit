class FavoritesController < ApplicationController
	def create
   @post = Post.find(params[:post_id])
   favorite = current_user.favorites.build(post: @post)
   authorize favorite
   if favorite.save
     flash[:notice] = "Favorite was saved."
       # Add code to generate a success flash and redirect to @post
       # Remember the path shortcut: [@post.topic, @post]
     else
       flash[:alert] = "Favorite was not saved"
     end
     redirect_to [@post.topic, @post]
   end

   def destroy
     @post = Post.find(params[:post_id])
     favorite = current_user.favorites.find_by(post: @post)
     authorize favorite
     if favorite.destroy
       flash[:notice] = "Favorite was removed"
     else
       flash[:alert] = "Favorite was not removed"
     end
     redirect_to [@post.topic, @post]
   end
end
