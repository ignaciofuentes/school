module ApplicationHelper

  def stylesheet(*args)
    content_for(:head){stylesheet_link_tag(*args)} 
  end
  
    def javascript(*args)
    content_for(:head){javascript_include_tag(*args)} 
  end

  def shorten_string(string, count)
    if string.length >= count
      shortened = string[0, count]
      splitted = shortened.split(/\s/)
      words = splitted.length
      splitted[0, words-1].join(" ") + ' ...'
    else
      string 
    end
  end

  def currency
    Configuration.find_by_config_key("CurrencyType").config_value
  end

  def is_active_controller(c)
    if c == controller.controller_name
      "active"
    end
  end

end
