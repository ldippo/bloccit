require 'rails_helper'





describe Vote do
  include TestFactories
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        expect( Vote.new(value: 2).valid? ).to eq(false)
        expect( Vote.new(value: 1).valid?).to eq(true)
        expect(Vote.new(value: -1).valid?).to eq(true)
      end
    end
  end

describe 'after_save' do
  include TestFactories
     it "calls `Post#update_rank` after save" do
       post = associated_post
       vote = Vote.new(value: 1, post: post)
       expect(post).to receive(:update_rank)
       vote.save
     end
   end

end 