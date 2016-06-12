module ApplicationHelper


  def custom_menu_link(url,icon,text,class_for_count,count,second_class_for_count='',second_count=1)
    icon_for_link=content_tag(:i,'',:class => 'icon '+icon)
    div_for_link=content_tag(:i)
    if count>0
      div_for_link=content_tag(:div,count,:class => 'ui labelForMenu '+class_for_count)
    end

    final_content_tag=icon_for_link+text+div_for_link
    if second_class_for_count!=''
      final_content_tag+= content_tag(:div,second_count,:class => 'ui labelForMenu '+second_class_for_count)
    end
    content_tag(:a, final_content_tag,:class => 'item', :href => url)
  end


end
