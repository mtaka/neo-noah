class CaseStudyArticle < Article
  DEFAULT_INFO_ATTS = [
    { role: 'IssuesAndResults', title: '課題と効果', data_type: 'FromToPairs'},
    { role: 'CustomerProfile', title: '顧客概要', data_type: 'NameValuePairs' },
  ]
  DEFAULT_CHAPTER_ATTS = [
    { role: 'Background', title: '背景' },
    { role: 'issues', title: '課題' },
    { role: 'Solution', title: '解決' },
    { role: 'Advantage', title: '決定のポイント' },
    { role: 'Implementation', title: '実装' },
    { role: 'Result', title: '結果' },
    { role: 'Future', title: '今後' },
    { role: 'Team', title: 'チーム' },
  ]
  def default_info_atts; DEFAULT_INFO_ATTS; end
  def default_chapter_atts; DEFAULT_CHAPTER_ATTS; end
  def self.model_neme
    Article.model_neme
  end
end
