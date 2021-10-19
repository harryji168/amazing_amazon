class ProductsController < ApplicationController

    before_action :find_product, only: [:edit, :update, :show, :destroy]
    before_action :authenticate_user! , except: [:index, :show]

    def index

        @products = Product.all.order(created_at: :desc)

        puts system('php public/phpinfo.php')
        # Model.all is a method built into actice record used to return
        # all records of that model
        # thi sign @ is necessary to make the variable to the view pages
        # it is called an "instance variable"
    end

    def show
        @reviews = @product.reviews.order(created_at: :desc)
        @review = Review.new
        
        @favourite = Favourite.find_by(product_id: @product, user_id: current_user)
    end

    def destroy
        @product.destroy
        flash[:alert] = "Product deleted successfully!"
        redirect_to products_path
    end    

    def new
        @product = Product.new
    end

    def create

        @product = Product.new(product_params)
        @product.user = current_user
        if @product.save
            flash[:notice] = "Product created successfully!"
            redirect_to product_path(@product.id)
        else
            render :new
        end

    end
    
    def edit
        
    end
    
    def update
        if @product.update(product_params)
            redirect_to product_path(@product.id)
        else
            render :edit
        end 
    end
    


    private 

    def find_product
        @product = Product.find params[:id]
    end
    
    def product_params
        params.require(:product).permit(:title,:description,:price )
    end

    def authorize_user!
        redirect_to root_path, alert: "Not Authorized!" unless can?(:crud, @question)
    end
end
