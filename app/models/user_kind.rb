# Encoding: utf-8
class UserKind 
  attr_accessor :id, :title
    
  USER_KINDS = {
    :info_admin           => "Info administrator",
    :institution_admin    => "Administrator ustanove",
    :coordination_member  => "Član koordinacijskega odbora",    
    :honorable_member     => "Član častnega odbora",
    :project_president    => "Predsednik projekta",
    :mayor                => "Župan",
    :deputy_mayor         => "Podžupan"
  }
  
  ALL_USER_KINDS = USER_KINDS.merge({ :admin => "Super administrator" })
  
  def initialize(options = {})
    self.id = options[:id].to_sym if options[:id]
    self.title = options[:title].to_s if options[:title]
    return unless @id.present? and @title.present?
  end
  
  class << self
    def find(id)
      return unless id.present? and USER_KINDS.include?(id.to_sym)
      id = id.to_sym
      self.new :id => id, :title => USER_KINDS[id]
    end
    
    def find_among_all(id)
      return unless id.present? and ALL_USER_KINDS.include?(id.to_sym)
      id = id.to_sym
      self.new :id => id, :title => ALL_USER_KINDS[id]
    end
    
    def all
      USER_KINDS.map { |array| self.new :id => array[0], :title => array[1] }
    end
    
    def all_with_admin
      ALL_USER_KINDS.map { |array| self.new :id => array[0], :title => array[1] }
    end

    def to_hash
      USER_KINDS
    end
        
    def info_admin 
      "info_admin"
    end       
  end
  
  def info_admin?
    id == :info_admin
  end
  
  def institution_admin?
    id == :institution_admin
  end

  def to_s
    title
  end
end
