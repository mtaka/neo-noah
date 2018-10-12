class Article < ApplicationRecord
  has_many :infos
  has_many :chapters
  DEFAULT_INFO_ATTS = []
  DEFAULT_CHAPTER_ATTS = []
  def default_info_atts; self::DEFAULT_INFO_ATTS; end
  def default_chapter_atts; self::DEFAULT_CHAPTER_ATTS; end
  def build_defaults type, default_atts_ref
    tb = send(type)
    default_atts = send(default_atts_ref)
    default_atts.each do |att|
      role = att[:role]
      puts tb.where(role: role).count
    end
  end
end
