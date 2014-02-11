# Encoding: utf-8
class Visible
  # Yes please
  attr_accessor :id, :title

  VISIBLE_KINDS = {
      :visible      => "Vidno",
      :invisible    => "Ni vidno"
  }

  def initialize(options = {})
    self.id = options[:id].to_sym if options[:id]
    self.title = options[:title].to_s if options[:title]
    return unless @id.present? and @title.present?
  end

  class << self
    def find(id)
      return unless id.present? and VISIBLE_KINDS.include?(id.to_sym)
      id = id.to_sym
      self.new :id => id, :title => VISIBLE_KINDS[id]
    end

    def all
      VISIBLE_KINDS.map { |array| self.new :id => array[0], :title => array[1] }
    end

    def to_hash
      VISIBLE_KINDS
    end

    def visible
      "visible"
    end

    def invisible
      "invisible"
    end

  end

  def to_s
    title
  end

end