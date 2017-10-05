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
  def icon(a)
    cls = a[:cls]
    clk = a[:clk]
    hov = a[:hov]
    res = "<span class='glyphicon glyphicon-#{cls}' aria-hidden='true' "

    res += "onclick='#{clk}' " if clk
    res += "onmouseover='#{hov}' " if hov

    res += '></span>'
    return res.html_safe
  end

  def _method(method)
    "<input name='_method' type='hidden' value='#{method}' />".html_safe
  end

end
