class Word < ActiveRecord::Base
  attr_reader :per_page
  @per_page = 7
  attr_writer :inline_forms_attribute_list

  belongs_to :source
  belongs_to :goal
  belongs_to :wordtype
  #belongs_to :source


  default_scope where("tr_pap_cw <> ''").order(:tr_pap_cw)

  scope :nederlands, where("tr_nl <> '' and NOT ISNULL(tr_nl)").order(:tr_nl)
  scope :spaans, where("tr_es <> '' and NOT ISNULL(tr_es)").order(:tr_es)
  scope :engels, where("tr_en <> '' and NOT ISNULL(tr_en)").order(:tr_en)

  def _presentation
    "#{name}"
  end

  def has_description?
    ! (description.nil? || description.empty?)
  end

  def has_dutch?
    ! (tr_nl.nil? || tr_nl.empty?)
  end

  def has_english?
    ! (tr_en.nil? || tr_en.empty?)
  end

  def has_spanish?
    ! (tr_es.nil? || tr_es.empty?)
  end

  def has_pap_cw?
    ! (tr_pap_cw.nil? || tr_pap_cw.empty?)
  end

  def has_wordtype?
    ! (wordtype.nil? || wordtype.name == '-')
  end

  def has_goal?
    ! (goal.nil? || goal.name == '-')
  end

  def has_source?
    ! (source.nil? || source.name == '-')
  end

end
