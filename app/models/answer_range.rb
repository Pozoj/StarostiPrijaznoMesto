class AnswerRange
  attr_accessor :id, :title
  
  RANGES = {
    :local          => "Lokalna veljava",
    :regional       => "Regijska veljava",
    :country        => "Državna veljava"
  }
  
  def initialize(options = {})
    self.id = options[:id].to_sym if options[:id]
    self.title = options[:title].to_s if options[:title]
    return unless @id.present? and @title.present?
  end
  
  class << self
    def find(id)
      return unless id.present? and RANGES.include?(id.to_sym)
      id = id.to_sym
      self.new :id => id, :title => RANGES[id]
    end

    def all
      RANGES.map { |array| self.new :id => array[0], :title => array[1] }
    end

    def to_hash
      RANGES
    end
  end
  
  def to_s
    title
  end  
end