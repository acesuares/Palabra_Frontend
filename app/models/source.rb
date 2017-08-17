class Source < ActiveRecord::Base
  
  has_many :words

  default_scope order(:name)

  def self.collection_for_select
    all.collect {|p| [ p.name, p.id ]}.unshift [ 'Alle bronnen', -1 ]    
  end

end
