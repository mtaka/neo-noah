class CaseStudyArticlesController < ArticlesController
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:case_study_article).permit(:title, :subtitle, :url, :cover_image_url, :abstract, :description, :type)
    end
end
