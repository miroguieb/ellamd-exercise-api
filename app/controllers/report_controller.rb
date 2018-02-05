class ReportController < ApplicationController
  # POST /report/create
  def create
    patient = report_params[:patient]
    ingredients = report_params[:ingredients].map{ |ingredient| [ ingredient[:name], ingredient[:percentage] ] }
    
    pdf = ReportPDF.new(patient, ingredients)

    send_data pdf.render,
      filename: "report.pdf",
      disposition: :inline,
      type: "application/pdf"
  end

  private
    # Only allow a trusted parameter "white list" through.
    def report_params
      params.permit(patient: [:name, :address, :dob], ingredients: [[:name, :percentage]])
    end
end
