require "prawn/measurement_extensions"

class ApplicationPDF
  include Prawn::View

  private

  def render_page_numbers
    number_pages "#{Time.current.to_s(:us_friendly)} - <page>/<total>",
      at: [bounds.right - 250, 0],
      width: 250,
      size: 9,
      align: :right,
      color: "bbbbbb"
  end

end
