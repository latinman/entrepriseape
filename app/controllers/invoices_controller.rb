class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  def index
    @invoices = Invoice.all
  end

  def show
  end

  def new
    @invoice = Invoice.new
  end

  def edit
  end

  def create
    @invoice = Invoice.new(invoice_params)

      if @invoice.save
        flash[:success] = "Invoice Created!"
        redirect_to @invoice
      else
        flash[:danger] = "Error creating invoice."
        render "new"
      end
    end

  def update

      if @invoice.update(invoice_params)
        flash[:success] = "Invoice was successfully updated!"
        redirect_to @invoice
      else
        flash[:danger] = "Error updating invoice."
        render "edit"
      end
    end

  def destroy
    @invoice.destroy
    redirect_to invoices_path
  end

  private

    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    def invoice_params
      params.require(:invoice).permit(:date, :company, :tax, :salesperson)
    end
end
