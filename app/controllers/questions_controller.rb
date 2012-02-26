# class QuestionsController < ApplicationController
#   load_and_authorize_resource
#   skip_load_resource :only => [:index]
#   skip_before_filter :authenticate_user!, :only => [:index]
#   
#   def index
#     @posts = PublicPost.questions
#   end
#   
#   def unaddressed
#     @title = "Nenaslovljena vprašanja"
#     @no_posts_message = "Trenutno ni nenaslovljenih vprašanj."
#     @posts = UnaddressedPost.questions.order(sort_column + " " + sort_direction)
#     render "posts/common/unaddressed"
#   end
#   
#   def addressed
#     @title = "Naslovljena vprašanja"
#     @no_posts_message = "Trenutno ni naslovljenih vprašanj."
#     @posts = AddressedPost.institutionalized.questions.order(sort_column + " " + sort_direction)
#     render "posts/common/addressed"
#   end
#   
#   def misplaced
#     @title = "Napačno naslovljena vprašanja"
#     @no_posts_message = "Trenutno ni napačno naslovljenih vprašanj."
#     @posts = AddressedPost.misplaced.questions.order(sort_column + " " + sort_direction)
#     render "posts/common/addressed"
#   end
# end