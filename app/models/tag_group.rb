class TagGroup 
  attr_accessor :id, :title
    
  TAG_GROUPS = {
    :first  => "Stavbne in zunajstavbne površine",
    :second => "Prevoz",
    :third  => "Bivališča",
    :fourth => "Družabno življenje",
    :fifth  => "Spoštovanje in vključevanje v družbo",
    :sixth  => "Družabno angažiranje in zaposlitev",
    :seventh => "Občevanje in obveščanje",
    :eight  => "Storitve skupnosti in zdravstvenih služb"
  }
  
  def initialize(options = {})
    self.id = options[:id].to_sym if options[:id]
    self.title = options[:title].to_s if options[:title]
    return unless @id.present? and @title.present?
  end
  
  class << self
    def find(id)
      return unless id and TAG_GROUPS.include?(id.to_sym)
      id = id.to_sym
      self.new :id => id, :title => TAG_GROUPS[id]
    end
    
    def all
      TAG_GROUPS.map { |array| self.new :id => array[0], :title => array[1] }
    end
    
    def to_hash
      TAG_GROUPS
    end
  end
  
  def to_s
    title
  end
end
