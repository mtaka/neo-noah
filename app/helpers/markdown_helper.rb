module MarkdownHelper
  class CustomRenderer < Redcarpet::Render::HTML
    def image(link, title, alt)
      base = Settings.base_url || ''; link =  base+link
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
    text = text || ''
    markdown = Redcarpet::Markdown.new(CustomRenderer)
    html = markdown.render(text)
    raw(html)
  end
end

