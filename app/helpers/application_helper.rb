module ApplicationHelper
    def tabbed_menu_item(text, link)
  active_class =
    if request.path.include?(link)
      'active'
    else
      ''
    end

  link_to text, link, class: active_class
end
end
