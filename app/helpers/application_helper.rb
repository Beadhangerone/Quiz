module ApplicationHelper
  def recogPath(path)
    Rails.application.routes.recognize_path(path)
  end
  def active(urls, controller)
    if urls
      urls.each do |url|
        if controller && controller_name == recogPath(url)[:controller]
          return 'active'
          break
        elsif !controller && controller_name == recogPath(url)[:controller] && action_name == recogPath(url)[:action]
          return 'active'
          break
        end
      end
    end
  end
  def icon(cls, act)
    "<span class='glyphicon glyphicon-#{cls}' onclick='#{act}' aria-hidden='true'></span>".html_safe
  end

  def _method(method)
    "<input name='_method' type='hidden' value='#{method}' />".html_safe
  end

end
