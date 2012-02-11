class Sex
  attr_accessor :id, :title
    
  SEX_KINDS = {
    :man      => "Moški spol",
    :woman    => "Ženski spol",
    :unknown  => "Neznan spol"
  }
  
  def initialize(options = {})
    self.id = options[:id].to_sym if options[:id]
    self.title = options[:title].to_s if options[:title]
    return unless @id.present? and @title.present?
  end
  
  class << self
    def find(id)
      return unless id and SEX_KINDS.include?(id.to_sym)
      id = id.to_sym
      self.new :id => id, :title => SEX_KINDS[id]
    end
    
    def all
      SEX_KINDS.map { |array| self.new :id => array[0], :title => array[1] }
    end
    
    def to_hash
      SEX_KINDS
    end
    
    def man
      "man"
    end
    
    def woman
      "woman"
    end
           
    def unknown
      "unknown"
    end       
  end
  
  def man?
    id == :man
  end

  def woman?
    id == :woman
  end

  def unknown?
    id == :unknown
  end

  def to_s
    title
  end
  
end