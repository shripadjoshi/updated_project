module ApplicationHelper

  def generate_search_form(hash)
    form_tag(hash[:index_path], method: "GET") do
      text_field_tag(:search, nil, placeholder: hash[:placeholder])
    end
  end

  def generate_common_links(hash)
   html = ""
   html += link_to('Export To Excel', hash[:index_path]) + " | " if hash[:object].present?
   html += link_to(hash[:create_text], hash[:create_path])
   return html.html_safe
  end

  def generate_edit_delete_link(hash)
   html = ""
   html += link_to('Edit', hash[:path_value], class: 'btn btn-min btn-primary')
   html += "&nbsp;"
   html += link_to('Delete', hash[:object], method: "Delete", confirm: "Are you sure?", class: 'btn btn-min btn-primary')
   return html.html_safe
  end

  def generate_image_data(path_val, object, image_no)
      content_tag(:div, class: "modal-body" ) do
      #content_tag(:div, id: "outer-image#{image_no}", class: "outer-image" ) do
      content_tag(:div, nil , class: "right-align") do
          simple_form_for(object, url: path_val,
             html: {method: :put, class: 'form-horizontal', id: 'remove_image_form' }) do |f|
             link_to('Want to remove this image?', 'javascript:void(0)', {class: 'remove_image'}) +
             hidden_field_tag("remove_image", image_no)
           end
      end +
      content_tag(:b, eval("object.avatar#{image_no}.file.filename")) +
      content_tag(:span, " (Image #{image_no}) ") +
      tag(:br) +
      content_tag(:center)  do
       tag(:image, src: eval("object.avatar#{image_no}_url(:medium)"))
       #tag(:image, src: eval("object.avatar#{image_no}_url"))
      end
    #end
      end +
    content_tag(:h4, "Add New/Update Image") +
    content_tag(:div, class: "modal-footer" ) do
        simple_form_for object, url: path_val, html: {method: :put, class: 'form-horizontal' } do |f|
          if image_no == 1
            f.file_field(:avatar1)
          elsif image_no == 2
            f.file_field(:avatar2)
          else
            f.file_field(:avatar3)
          end +
          link_to('Add Image', 'javascript:void(0)', {class: 'btn add-new-image btn-primary'})
          #f.submit("Add Image", class: "btn")
          #link_to('Close', 'javascript:void(0)', {class: 'btn'})
          #tag(:a, "Close", class: "btn", data-dismiss: "modal", href: '#')
         end
    end
  end

 def options_for_research_status
   return (['Unassigned', 'Assigned', 'On-Hold', 'In-Review', 'Completed'])
 end
 
end
