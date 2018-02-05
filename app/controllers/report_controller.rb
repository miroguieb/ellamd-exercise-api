class ReportController < ApplicationController
  # POST /report/create
  def create
    user = report_params[:user]
    ingredients = report_params[:ingredients].map{ |ingredient| [ ingredient[:name], ingredient[:percentage] ] }
    
    pdf = ReportPDF.new(user, ingredients)

    send_data pdf.render,
      filename: "report.pdf",
      disposition: :inline,
      type: "application/pdf"
  end

  private
    # Only allow a trusted parameter "white list" through.
    def report_params
      params.permit(user: [:name, :address, :dob], ingredients: [[:name, :percentage]])
    end
end
