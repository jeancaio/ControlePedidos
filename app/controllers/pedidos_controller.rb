class PedidosController < ApplicationController
  before_action :set_pedido, only: %i[show edit update destroy liberacao]
  # GET /pedidos
  # GET /pedidos.json
  def index
    @q = Pedido.ransack(params[:q])
    @pedidos = @q.result.includes(:cliente).paginate(page: params[:page], per_page: 10)
  end

  # GET /pedidos/1
  # GET /pedidos/1.json
  def show
    @pedidos = Pedido.find(params[:id])
  end

  # GET /pedidos/new
  def new
    @pedido = Pedido.new
    @pedido.itens_pedido.build
  end

  # GET /pedidos/1/edit
  def edit; end

  # POST /pedidos
  # POST /pedidos.json
  def create
    @pedido = Pedido.new(pedido_params)
    respond_to do |format|
      if @pedido.save
        format.html { redirect_to @pedido, notice: 'Pedido criado' }
        format.json { render :show, status: :created, location: @pedido }
        @pedido.atualiza_estoque_diminui
      else
        format.html { render :new }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  def liberacao
    authorize @pedido

    respond_to do |format|
      if @pedido.update(pedido_params)
        format.html { redirect_to @pedido, notice: 'Pedido liberado' }
        format.json { render :show, status: :ok, location: @pedido }
      else
        format.html { render :edit }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pedidos/1
  # PATCH/PUT /pedidos/1.json
  def update
    @pedido.atualiza_estoque_aumenta
    @pedido.itens_pedido.destroy_all
    respond_to do |format|
      if @pedido.update(pedido_params)

        format.html { redirect_to @pedido, notice: 'Pedido atualizado' }
        format.json { render :show, status: :ok, location: @pedido }
        @pedido.atualiza_estoque_diminui
      else
        format.html { render :edit }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pedidos/1
  # DELETE /pedidos/1.json
  def destroy
    authorize @pedido
    @pedido.atualiza_estoque_aumenta
    @pedido.destroy
    respond_to do |format|
      format.html { redirect_to pedidos_url, notice: 'Pedido excluído' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pedido
    @pedido = Pedido.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def pedido_params
    params.require(:pedido).permit(:cliente_id, :status, itens_pedido_attributes: [:quantidade, %i[produto_id _destroy]])
  end
end
