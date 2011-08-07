module ApplicationHelper
  def is_current?(name)
    controller_name==name ? 'selected' : ''
  end
end
