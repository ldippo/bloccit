require 'rails_helper'
 
 describe VotesController do 
 
   include TestFactories
   include Devise::TestHelpers
 
   
   before do 
     @post = associated_post
     @user = authenticated_user
     sign_in @user
   end


   describe '#up_vote' do
     it "adds an up-vote to the post" do
       request.env["HTTP_REFERER"] = '/'
       expect {
         post( :up_vote, post_id: @post.id )
       }.to change{ @post.up_votes }.by 1
     end
   end
 end