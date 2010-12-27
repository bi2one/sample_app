module PagesHelper
  def logo
    l = image_tag "logo.png", :alt => "Sample App", :class => "round"
    link_to l, root_path
  end
end
