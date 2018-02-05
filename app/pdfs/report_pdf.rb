class ReportPDF < ApplicationPDF
  HEADER_UNDERLINE_COLOR = "aaaaaa"
  HEADER_FONT_COLOR      = "3a6794"
  HEADER_TITLE_WIDTH     = 2.in
  HEADER_HEIGHT          = 0.4.in
  TABLE_PADDING_TOP      = 0.3.in
  TABLE_ROW_COLORS       = [ "eeeeee", "ffffff" ]
  TABLE_FONT_COLOR       = "000000"

  def initialize(patient, ingredients)
    @patient = patient
    @ingredients = ingredients

    render_header_row('Name', @patient[:name])
    render_header_row('Address', @patient[:address])
    render_header_row('Date of Birth', @patient[:dob])

    render_table(['Ingredient', 'Percentage(%)'], ingredients)

    render_page_numbers
  end

  def document
    @document ||= Prawn::Document.new(
      page_layout: :portrait,
      page_size: "A4"
    )
  end

  private

  def stroke_header_line
    stroke_color HEADER_UNDERLINE_COLOR
    stroke_horizontal_line(bounds.left, bounds.width, at: cursor)
  end

  def render_header_row(title, value)
    bounding_box([0, cursor], width: bounds.width, height: HEADER_HEIGHT) do
      fill_color HEADER_FONT_COLOR
      font "Helvetica", size: 16, style: :bold do
        text_box "#{title}:",
          at: [bounds.left + 5, bounds.top],
          width: bounds.width - 10,
          height: bounds.height,
          align: :left,
          valign: :bottom,
          overflow: :shrink_to_fit,
          single_line: true
      end

      fill_color "000000"
      font "Helvetica", size: 14 do
        text_box value,
          at: [HEADER_TITLE_WIDTH, bounds.top],
          width: bounds.width - 10,
          height: bounds.height,
          align: :left,
          valign: :bottom,
          overflow: :shrink_to_fit,
          single_line: true
      end
    end

    stroke_header_line
  end

  def table_cell_style
    {
      border_width: 0.5,
      size: 10,
      overflow: :shrink_to_fit,
      single_line: true,
      padding: [ 4, 5, 4, 5]
    }
  end

  def table_header_style
    {
      border_width: [ 0, 0, 1.5, 0 ],
      size: 10,
      font_style: :bold,
      overflow: :shrink_to_fit,
      single_line: true
    }
  end

  def table_column_widths
    {}
  end

  def render_table(header, data)
    move_down TABLE_PADDING_TOP
    fill_color TABLE_FONT_COLOR
    table([ header, *data ]) do |pdf_table|
      pdf_table.header        = true
      pdf_table.width         = bounds.width
      pdf_table.column_widths = table_column_widths
      pdf_table.cell_style    = table_cell_style
      pdf_table.row_colors    = TABLE_ROW_COLORS

      pdf_table.row(0).style(table_header_style)
    end
  end

end
