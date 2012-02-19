class Post < ActiveRecord::Base
  belongs_to :original_post, :dependent => :destroy
  belongs_to :user, :foreign_key => "info_admin_id"
  has_many :answers, :dependent => :destroy
  has_many :photos, :as => :holder, :dependent => :destroy  
  
  validates_presence_of :post_status_id
  validates_presence_of :title, :summary, :text, :post_kind_id, :sex_id, :tag_group_id, :if => :approved?
  
  scope :rejected,    where(:post_status_id => "rejected")
  scope :approved,    where(:post_status_id => "approved")  
  scope :comments,    where(:post_kind_id => "comment")
  scope :questions,   where(:post_kind_id => "question")
  scope :suggestions, where(:post_kind_id => "suggestion")
  
  
  class << self
    
    # Returns all questions, that don't have an answer
    # => Unaddressed questions are posts with post_kind_id == "question" that don't have an related answer
    def unaddressed_questions
      self.approved.questions.joins("LEFT JOIN answers ON posts.id = answers.post_id").where("answers.id IS NULL") #.order("created_at DESC")
    end

    # Returns all questions, that have an answer with institution_id and answer_status = 'institutionalized'
    # => Addressed questions are posts with post_kind_id == "question" that have an related answer that's been institutionalized
    def addressed_questions
      self.approved.questions.joins("LEFT JOIN answers ON posts.id = answers.post_id").where("answers.id IS NOT NULL AND answers.answer_status = 'institutionalized'").order("created_at DESC")
    end
    
    # Returns all questions, that have an answer with answer_status = 'answered'
    # => questions are ordered 
    def answered_questions
      self.approved.questions.joins("LEFT JOIN answers ON posts.id = answers.post_id").where("answers.answer_status = 'answered'").order("answers.updated_at DESC")
    end
    
  end # class << self
  
  def approved?
    status.approved?
  end

  def rejected?
    status.rejected?
  end
  
  def attachment_added?
    original_post.present? and original_post.photos.any?
  end
  
  def attachment
    if original_post.present? and original_post.photos.any?
      return original_post.photos.order(:id).last
    end
  end
  
  def attachment_name
    attachment.photo_file_name
  end
  
  def answer
    answers.answered.last
  end
  
  def responsible_institution
    answers.last.institution
  end
  
  def kind
    @kind ||= PostKind.find(post_kind_id)
  end
  
  def kind=(pk)
    self.post_kind_id = PostKind.find(pk).id if PostKind.find(pk)
  end
  
  def sender
    original_post.sender if original_post.present?
  end
  
  def sex
    @sex ||= Sex.find(sex_id)
  end
  
  def sex=(sx)
    self.sex_id = Sex.find(sx).id if Sex.find(sx)
  end
  
  # Returns a PostStatus instance
  def status
    @status ||= PostStatus.find(post_status_id)
  end
  
  def tag_group
    @tag_group ||= TagGroup.find(tag_group_id)
  end
  
  def tag_group=(tg)
    self.tag_group = TagGroup.find(tg).id if TagGroup.find(tg)
  end
  
  def to_s
    title
  end
end
