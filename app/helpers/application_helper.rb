module ApplicationHelper
  def login_helper style = ''
    if current_user.is_a?(GuestUser)
      (link_to "Login", new_user_session_path, class: style) + " " + (link_to "Register", new_user_registration_path, class: style)
    else
      link_to "Logout", destroy_user_session_path, method: :delete, class: style
    end
  end

  def source_helper(layout_name)
    if session[:source]
      greeting = "Thanks for visiting from #{session[:source]}"
      content_tag(:p, greeting, class: layout_name)
    end
  end

  def copyright_generator
    MarkAutoCopyright::Renderer.copyright 'GETMOREBIZONLINE', 'All rights reserved.'
  end

  def nav_items
    [
      {
        path: root_path,
        title: 'Home'
      },
      {
        path: blogs_path,
        title: 'Blog'
      },
      {
        path: portfolios_path,
        title: 'Portfolio'
      },
      {
        path: about_path,
        title: 'About'
      },
      {
        path: contact_path,
        title: 'Contact'
      }
    ]
  end

  def nav_helper style = 'nav-link', tag_type
    nav_links = ""
    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:path]}' class='#{style} #{active? item[:path]}'>#{item[:title]}</a></#{tag_type}>"
    end

    nav_links.html_safe
  end

  def active? path
    "active" if current_page? path
  end
end