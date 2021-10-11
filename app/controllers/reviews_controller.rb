class ReviewsController < ApplicationController

    #before_action :find_product 
    # destroy create
    def create
        #@product = Product.find params(:product_id)
        @review  = Review.new(params.require(:review).permit(:rate,:body))
        @review.product = Product.find params[:product_id]  
        # if saved successfuly then redirect to the show page of the question
        # otherwise still go to this show page but using render 
        # the difference between redirect and render
        # redirect is sending a get request '\questions\:id'
        # render is rendering the page 
        #byebug
        if @review.save
            redirect_to product_path(@product.id), notice: 'Review created!'
        else
            # we want to stay on this page
            @reviews = @product.reviews.order(created_at: :desc)
            # '/questions/show' is not the action 
            # it's the page /questions/show.html.erb
            render '/products/show'
        end

    end
    
    def destroy
        @review = Review.find params[:id]
        @review.destroy
        redirect_to product_path(@product), notice: 'Review Deleted'
    end
    
    def edit
        @review = Review.find params[:id]
        #byebug
    end

    def show
        @review = Review.find params[:id]
        #byebug
    end
    
    def update
        #byebug
        @review =Review.find params[:id]
        if @review.update(params.require(:review).permit(:rate,:body))
            redirect_to review_path(@review)
        else
            render :edit
        end 
         
    end

    
    
end
