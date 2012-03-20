class ReportsController < ApplicationController

  def new_batch_report
    @batch = Batch.find(params[:id])
  end

  def create_batch_report 
    batch = Batch.find(params[:batch_id])
    @students = batch.students
    @report_template = ReportTemplate.find(params[:report_template][:id])
    html = render_to_string(:layout =>"print_layout" , :template=>"report_templates/#{@report_template.file_name}")
    kit = PDFKit.new(html)
    kit.stylesheets << "#{Rails.root}/public/stylesheets/pdf.css"
    send_data(kit.to_pdf, :filename => "Boleta.pdf",
    :type => 'application/pdf', :disposition => 'inline')
  end

  
end
