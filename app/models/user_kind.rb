class UserKind 
  attr_accessor :id, :title
    
  USER_KINDS = {
    :info_admin         => "Info administrator",
    :worker             => "Uslužbenec",
    :leader             => "Vodja",
    :media_admin        => "Medijski administrator",
    :basic_admin        => "Splošni administrator",
    :president          => "Predsednik"
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
    
    def worker
      "worker"
    end
    
    def leader
      "leader"
    end
           
    def media_admin
      "media_admin"
    end       
    
    def basic_admin
      "basic_admin"
    end
    
    def president
      "president"
    end
       
  end
  
  def info_admin?
    id == :info_admin
  end
  
  def worker?
    id == :worker
  end

  def leader?
    id == :leader
  end

  def media_admin?
    id == :media_admin
  end

  def basic_admin?
    id == :basic_admin
  end

  def president?
    id == :president
  end
  
  def to_s
    title
  end
end
