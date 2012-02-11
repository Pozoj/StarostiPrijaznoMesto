class PostKind
  attr_accessor :id, :title
  
  STATUSES = {
    :comment      => "Komentar",
    :question     => "Vprašanje",
    :suggestion   => "Predlog"
  }
  
  def initialize(options = {})
    self.id = options[:id].to_sym if options[:id]
    self.title = options[:title].to_s if options[:title]
    return unless @id.present? and @title.present?
  end
  
  class << self
    def find(id)
      return unless id and STATUSES.include?(id.to_sym)
      id = id.to_sym
      self.new :id => id, :title => STATUSES[id]
    end

    def all
      STATUSES.map { |array| self.new :id => array[0], :title => array[1] }
    end

    def to_hash
      STATUSES
    end
    
    def keys
      ["comment", "question", "suggestion" ]
    end
  end
    
  def comment?
    id == :comment
  end
  
  def question?
    id == :question
  end

  def suggestion?
    id == :suggestion
  end

  def to_s
    title
  end  
end