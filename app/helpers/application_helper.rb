module ApplicationHelper
  def recogPath(path)
    Rails.application.routes.recognize_path(path)
  end
  def active(url, controller)
    if url
      if controller && controller_name == recogPath(url)[:controller]
          return 'active'
      elsif !controller && controller_name == recogPath(url)[:controller] && action_name == recogPath(url)[:action]
          return 'active'
      end
    end
  end
  def icon(cls)
    "<span class='glyphicon glyphicon-#{cls}' aria-hidden='true'></span>".html_safe
  end
end
