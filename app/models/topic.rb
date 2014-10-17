class Topic < ActiveRecord::Base
  has_many :posts

  def markdown_name
    render_as_markdown name
  end

  def markdown_description
    render_as_markdown description
  end

  private
  def render_as_markdown(text)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer,extensions)
    (redcarpet.render text).html_safe
  end
end
