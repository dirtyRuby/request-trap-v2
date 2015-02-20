class TrapsController < ApplicationController
  skip_before_filter  :verify_authenticity_token, only: :capture_request
  skip_before_action :authorize, only: :capture_request
  #
  # GET /traps
  #
  def index
    @traps = Trap.all.order(created_at: :desc)
    respond_to do |format|
      format.html
      format.js
    end
  end
  #
  # List all requests captured by certain traps action.
  #
  def new
    @trap = Trap.new
  end
  #
  # GET /traps/:trap_name/requests
  #
  def show
    if @trap = Trap.find_by_name(params[:trap_name]) || Trap.find_by_name(flash[:new_trap_name])
      @requests = @trap.requests.order(created_at: :desc)
    else
      respond_to do |format|
        format.html { redirect_to traps_path, notice: "No traps #{params[:trap_name]} found."}
      end
    end
  end
  #
  # PATCH/PUT /traps/:trap_name/requests
  #
  def update
    @trap = Trap.find_by_name(params[:trap_name])
    respond_to do |format|
      if @trap.update(trap_params)
        format.html { redirect_to trap_path(@trap), notice: 'Trap was successfully renamed.' }
      else
        format.html { redirect_to trap_path(@trap), notice: 'Trap wasn\'t updated' }
      end
    end
  end
  #
  # DELETE /traps/:trap_name/:id
  #
  def destroy
    Trap.find_by(name: params[:trap_name]).destroy
    respond_to do |format|
      format.html { redirect_to traps_path, notice: 'Trap was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  #
  # Capture traps/request and save to database action.
  #
  def capture_request
    already_exist = false
    already_exist = true if Trap.find_by(name: params[:trap_name])
    @trap = Trap.find_or_create_by(name: params[:trap_name])
    header = Hash.new
    request.headers.each { |key, value| header[key] = value.to_s unless value.is_a?(Hash) }
    @req = create_request(@trap, request.remote_ip, request.method, request.scheme, request.query_string,
                         request.query_parameters, request.cookies, header)

    respond_to do |format|
      if @trap
        WebsocketRails[:trap].trigger 'new', render_to_string(partial: 'traps/trap') unless already_exist
        WebsocketRails[:request].trigger 'new', render_to_string(partial: 'traps/request') if @req
        format.html { redirect_to traps_path, notice: 'Request was successfully captured.'}
      else
        format.html { redirect_to traps_path, notice: 'Request wasn\'t captured.'}
      end
    end
  end

  private
  def trap_params
    params.require(:trap).permit(:name)
  end

  def create_request (trap, remote_ip, request_method, scheme, query_string, query_params, cookies, headers=nil)
    trap.requests.create(remote_ip: remote_ip, request_method: request_method,
                         scheme: scheme, query_string: query_string,
                         query_params: query_params, cookies: cookies, headers: headers)
  end
end
