class ProductosController < ApplicationController
  before_action :set_producto, only: %i[ show edit update destroy ]

  # GET /productos or /productos.json
  def index
    @productos = Producto.all
  end

  # GET /productos/1 or /productos/1.json
  def show
  end

  # GET /productos/new
  def new
    @producto = Producto.new
    @textboton = "Crear"
  end

  # GET /productos/1/edit
  def edit
    @textboton = "Guardar"
  end

  # POST /productos or /productos.json
  def create

    @busqueda = Producto.find_by(codigo: producto_params[:codigo])

    if @busqueda.present?

      respond_to do |format|
        format.html { redirect_to "/productos/new", notice: "Código duplicado." }
        format.json { render :new, status: :ok, location: @producto }
      end

    else
      @producto = Producto.new(producto_params)

      if @producto.save 
        respond_to do |format|
          format.html { redirect_to producto_url(@producto), notice: "El producto ha sido creado." }
          format.json { render :show, status: :ok, location: @producto }
        end
      end
    end

  end

  # PATCH/PUT /productos/1 or /productos/1.json
  def update

    respond_to do |format|
      if @producto.update(producto_params)
        format.html { redirect_to producto_url(@producto), notice: "El producto ha sido actualizado." }
        format.json { render :show, status: :ok, location: @producto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /productos/1 or /productos/1.json
  def destroy
    @producto.destroy

    respond_to do |format|
      format.html { redirect_to productos_url, notice: "El producto ha sido eliminado." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_producto
      @producto = Producto.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def producto_params
      params.require(:producto).permit(:image,:codigo, :nombre, :descripcion, :precio)
    end
end
