module ApplicationHelper
	def menu_link_to(text, path)
		link_to_unless_current(text, path){content_tag(:span, text)}
	end

	def clothe_image_tag(clothe, options = {})
    if clothe.images.present?
      path = clothe_path(clothe, format: clothe.images.extension)
      link_to(image_tag(path, { alt: clothe.name }.merge(options)), path)
    else
      ""
    end
  end

end
