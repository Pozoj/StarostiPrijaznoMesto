class AnswerStatus
  attr_accessor :id, :title
  
  STATUSES = {
    :misplaced          => "Posredovano na napačno ustanovo",
    :answered           => "Odgovorjeno"
  }
  
  ALL_STATUSES = STATUSES.merge( {:institutionalized  => "Posredovano ustanovi" } )
  
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

    def find_among_all(id)
      return unless id and ALL_STATUSES.include?(id.to_sym)
      id = id.to_sym
      self.new :id => id, :title => ALL_STATUSES[id]
    end

    def all
      STATUSES.map { |array| self.new :id => array[0], :title => array[1] }
    end

    def to_hash
      STATUSES
    end
    
    def keys
      ["misplaced", "answered" ]
    end
  end
    
  def misplaced?
    id == :misplaced
  end
  
  def answered?
    id == :answered
  end
  
  def to_s
    title
  end  
end