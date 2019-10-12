class ProductsController < ApplicationController
  before_action :set_store

  def index
    @product = @store.products[0]
    @products = @store.products.includes(:user)
  end

  def new
    @product = Product.new
    @products = @store.products.includes(:user)
  end

  def create
    @product = @store.products.new(product_params)
    if @product.save
      redirect_to store_products_path(@store)
    else
      @products = @store.products.includes(:user)
      render :index
      alert("saveできず")
    end
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.update(product_params)
    redirect_to store_products_path(@store)
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :taste, :memo, :image).merge(user_id: current_user.id)
  end

  def set_store
    @store = Store.find(params[:store_id])
  end

end

# 商品が登録されていない状態で最初の画面を開くようにするにはアクションの
# 順番を変える必要が出てくるかも？
# 現状ホーム画面を開こうとするときに、コーヒーの情報ないのにどうすんの？って感じ
# のエラーが出てる