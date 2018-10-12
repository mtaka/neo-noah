class Article < ApplicationRecord
  has_many :infos
  has_many :chapters
  DEFAULT_INFO_ATTS = []
  DEFAULT_CHAPTER_ATTS = []
  def default_info_atts; DEFAULT_INFO_ATTS; end
  def default_chapter_atts; DEFAULT_CHAPTER_ATTS; end
  def build_defaults type, atts_ref
    tb, atts = send(type), send(atts_ref)
    atts.each do |att|
      role = att[:role]
      if tb.where(role: role).count==0
        tb.create!(att)
      end
    end
  end
  def build_default_infos; build_defaults :infos, :default_info_atts; end
  def build_default_chapters; build_defaults :chapters, :default_chapter_atts; end
end
