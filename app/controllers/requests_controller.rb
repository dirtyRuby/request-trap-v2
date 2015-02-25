class RequestsController < ApplicationController
  #
  # GET /traps/trap_name/requests/1
  #
  def show
    @request = Request.find_by(id: params[:id])
  end
  #
  # DELETE /traps/trap_name/requests/1
  #
  def destroy
    @request = Request.find_by(id: params[:id])
    id = @request.id
    @request.destroy
    respond_to do |format|
      format.html { redirect_to trap_path, notice: "Request with ID #{id} successfully deleted."}
      format.json { head :no_content }
    end
  end
end
