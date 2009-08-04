module InstallHelper
  def saved_settings
    content_tag :div, 'Your settings have been saved.', :class => 'notice'
  end
  
  def help_link
    content_tag :p, :style => 'font-weight: bold;' do
      link_to('View help docs &raquo;', 'http://warehouseapp.com/faqs/what-are-these-admin-settings-for')
    end
  end
end
