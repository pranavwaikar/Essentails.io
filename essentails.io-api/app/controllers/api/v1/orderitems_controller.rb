module Api
  module V1
    class OrderitemsController < ApplicationController

      def index
        orderitems = Orderitem.order("created_at DESC")
        render json: {status:'SUCCESS', message:'Loaded orderitems',data:orderitems}, status: :ok
      end

      def create
        orderitem = Orderitem.new(orderitem_params)
        if orderitem.save
          render json: {status:'SUCCESS', message:'Created orderitem',data:orderitem}, status: :ok
        else
          render json: {status:'FAILURE', message:'Failed to create orderitem',
            data:orderitem.errors}, status: :unprocessable_entry
        end
      end

      def show
        orderitem = Orderitem.find(params[:id])
        render json: {status:'SUCCESS', message:'Found orderitem',data:orderitem}, status: :ok
      end

      def update
        orderitem = Orderitem.find(params[:id])
        if (orderitem.update_attributes(orderitem_params))
          render json: {status:'SUCCESS', message:'updated orderitem',data:orderitem}, status: :ok
        else
          render json: {status:'SUCCESS', message:'Failed to update orderitem',
            data:orderitem.errors}, status: :unprocessable_entry
        end
      end

      def destroy
        orderitem = Orderitem.find(params[:id])
        orderitem.destroy
        render json: {status:'SUCCESS', message:'Destroyed orderitem',data:orderitem}, status: :ok
      end

      private
      def orderitem_params
        params.permit(:name,:quantity,:price,:order_id)
      end

    end
  end
end