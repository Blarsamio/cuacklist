module SvgHelper
  def show_svg(path, options = {})
    File.open("app/assets/images/icons/#{path}", "rb") do |asset|
      pato = raw asset.read
      return pato
    end

    if pato
      file = pato.source.force_encoding("UTF-8")
      doc = Nokogiri::HTML::DocumentFragment.parse file
      svg = doc.at_css "svg"
      svg["class"] = options[:class] if options[:class].present?
    else
      doc = "<!-- SVG #{filename} not found -->"
    end
    raw doc
  end
end
