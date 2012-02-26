# require 'spec_helper'
# 
# # This spec was generated by rspec-rails when you ran the scaffold generator.
# # It demonstrates how one might use RSpec to specify the controller code that
# # was generated by Rails when you ran the scaffold generator.
# #
# # It assumes that the implementation code is generated by the rails scaffold
# # generator.  If you are using any extension libraries to generate different
# # controller code, this generated spec may or may not pass.
# #
# # It only uses APIs available in rails and/or rspec-rails.  There are a number
# # of tools you can use to make these specs even more expressive, but we're
# # sticking to rails and rspec-rails APIs to keep things simple and stable.
# #
# # Compared to earlier versions of this generator, there is very limited use of
# # stubs and message expectations in this spec.  Stubs are only used when there
# # is no simpler way to get a handle on the object needed for the example.
# # Message expectations are only used when there is no simpler way to specify
# # that an instance is receiving a specific message.
# 
# describe OriginalPostsController do
# 
#   # This should return the minimal set of attributes required to create a valid
#   # OriginalPost. As you add validations to OriginalPost, be sure to
#   # update the return value of this method accordingly.
#   def valid_attributes
#     {}
#   end
# 
#   describe "GET index" do
#     it "assigns all original_posts as @original_posts" do
#       original_post = OriginalPost.create! valid_attributes
#       get :index
#       assigns(:original_posts).should eq([original_post])
#     end
#   end
# 
#   describe "GET show" do
#     it "assigns the requested original_post as @original_post" do
#       original_post = OriginalPost.create! valid_attributes
#       get :show, :id => original_post.id.to_s
#       assigns(:original_post).should eq(original_post)
#     end
#   end
# 
#   describe "GET new" do
#     it "assigns a new original_post as @original_post" do
#       get :new
#       assigns(:original_post).should be_a_new(OriginalPost)
#     end
#   end
# 
#   describe "GET edit" do
#     it "assigns the requested original_post as @original_post" do
#       original_post = OriginalPost.create! valid_attributes
#       get :edit, :id => original_post.id.to_s
#       assigns(:original_post).should eq(original_post)
#     end
#   end
# 
#   describe "POST create" do
#     describe "with valid params" do
#       it "creates a new OriginalPost" do
#         expect {
#           post :create, :original_post => valid_attributes
#         }.to change(OriginalPost, :count).by(1)
#       end
# 
#       it "assigns a newly created original_post as @original_post" do
#         post :create, :original_post => valid_attributes
#         assigns(:original_post).should be_a(OriginalPost)
#         assigns(:original_post).should be_persisted
#       end
# 
#       it "redirects to the created original_post" do
#         post :create, :original_post => valid_attributes
#         response.should redirect_to(OriginalPost.last)
#       end
#     end
# 
#     describe "with invalid params" do
#       it "assigns a newly created but unsaved original_post as @original_post" do
#         # Trigger the behavior that occurs when invalid params are submitted
#         OriginalPost.any_instance.stub(:save).and_return(false)
#         post :create, :original_post => {}
#         assigns(:original_post).should be_a_new(OriginalPost)
#       end
# 
#       it "re-renders the 'new' template" do
#         # Trigger the behavior that occurs when invalid params are submitted
#         OriginalPost.any_instance.stub(:save).and_return(false)
#         post :create, :original_post => {}
#         response.should render_template("new")
#       end
#     end
#   end
# 
#   describe "PUT update" do
#     describe "with valid params" do
#       it "updates the requested original_post" do
#         original_post = OriginalPost.create! valid_attributes
#         # Assuming there are no other original_posts in the database, this
#         # specifies that the OriginalPost created on the previous line
#         # receives the :update_attributes message with whatever params are
#         # submitted in the request.
#         OriginalPost.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
#         put :update, :id => original_post.id, :original_post => {'these' => 'params'}
#       end
# 
#       it "assigns the requested original_post as @original_post" do
#         original_post = OriginalPost.create! valid_attributes
#         put :update, :id => original_post.id, :original_post => valid_attributes
#         assigns(:original_post).should eq(original_post)
#       end
# 
#       it "redirects to the original_post" do
#         original_post = OriginalPost.create! valid_attributes
#         put :update, :id => original_post.id, :original_post => valid_attributes
#         response.should redirect_to(original_post)
#       end
#     end
# 
#     describe "with invalid params" do
#       it "assigns the original_post as @original_post" do
#         original_post = OriginalPost.create! valid_attributes
#         # Trigger the behavior that occurs when invalid params are submitted
#         OriginalPost.any_instance.stub(:save).and_return(false)
#         put :update, :id => original_post.id.to_s, :original_post => {}
#         assigns(:original_post).should eq(original_post)
#       end
# 
#       it "re-renders the 'edit' template" do
#         original_post = OriginalPost.create! valid_attributes
#         # Trigger the behavior that occurs when invalid params are submitted
#         OriginalPost.any_instance.stub(:save).and_return(false)
#         put :update, :id => original_post.id.to_s, :original_post => {}
#         response.should render_template("edit")
#       end
#     end
#   end
# 
#   describe "DELETE destroy" do
#     it "destroys the requested original_post" do
#       original_post = OriginalPost.create! valid_attributes
#       expect {
#         delete :destroy, :id => original_post.id.to_s
#       }.to change(OriginalPost, :count).by(-1)
#     end
# 
#     it "redirects to the original_posts list" do
#       original_post = OriginalPost.create! valid_attributes
#       delete :destroy, :id => original_post.id.to_s
#       response.should redirect_to(original_posts_url)
#     end
#   end
# 
# end