module MarkdownHelper
  class CustomRenderer < Redcarpet::Render::HTML
    def image(link, title, alt)
      ttl = title.gsub(';;', ' ')
      cap = title.gsub(';;', '<br>')
      img = %(<div class='image'><img src='#{link}' alt='#{ttl}' title='#{ttl}'></div>)
      caption = %(<div class='caption'>#{cap}</div>)
      %(<div class='#{alt}'>#{img}<br>#{caption}</div>)
    end
  end

  def md2html text
    #html = CommonMarker.render_html(text)
    #renderer = CustomRenderer.new
    #markdown = Redcarpet::Markdown.new(render)
    markdown = Redcarpet::Markdown.new(CustomRenderer)
    html = markdown.render(text)
    raw(html)
  end
end

