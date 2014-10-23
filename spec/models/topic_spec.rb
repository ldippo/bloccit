describe Topic do
   describe "scopes" do
 
     before do 
       @public_topic = Topic.create!(public:true) 
       @private_topic = Topic.create!(public: false)
     end

 
     describe "privately_viewable" do
       it "returns a relation of all private topics" do
         # Your code here
       end
     end
 
     describe "visible_to(user)" do
       it "returns all topics if the user is present" do
         user = true # sneaky solution; we don't need a real user, just something truthy
         expect(Topic.visible_to(user)).to eq([@public_topic,@private_topic])
       end
 
       it "returns only public topics if user is nil" do
         expect(Topic.visible_to(nil)).to eq([@public_topic])
       end
     end
   end
 end