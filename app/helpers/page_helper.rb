module PageHelper
  def render_groups_of_post
    output = ''
    @posts.each do |row|
      output << "<div class='row'>"
      row.each do |post|
        output << <<~CODE
          <div class='col-md-4'>
          <div class='card border-secondary mb-3' style='max-width: 20rem;'>
            <div class='card-header'>#{medium_date post.created_at}</div>
            <div class='card-body'>
              <h4 class='card-title'>#{post.title}</h4>
              <p class='card-text'>
                #{truncate(post.content.to_plain_text, length: 80) { link_to 'Read More', admin_post_path(post) }}
              </p>
            </div>
          </div>
          </div>
        CODE
      end
      output << "</div>\n"
    end
    
    raw output
  end
end
