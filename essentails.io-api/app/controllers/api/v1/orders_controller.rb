module Api
  module V1
    class OrdersController < ApplicationController

      def index
        orders = Order.order("created_at DESC")
        render json: {status:'SUCCESS', message:'Loaded orders',data:orders}, status: :ok
      end

      def create
        consumer = Consumer.find(params[:consumer_id])
        order = consumer.orders.create(order_params)
        render json: {status:'SUCCESS', message:'Created order',data:order}, status: :ok
      end

      def show
        order = Order.find(params[:id])        
        render json: {status:'SUCCESS', message:'Found order',data:order}, status: :ok
      end

      def get_order_items
        order = Order.find(params[:id])
        items = order.orderitems
        render json: {status:'SUCCESS', message:'fetched all orderitems for order',data:items}, status: :ok
      end

      def update
        order = Order.find(params[:id])
        if (order.update_attributes(order_params))
          render json: {status:'SUCCESS', message:'updated order',data:order}, status: :ok
        else
          render json: {status:'SUCCESS', message:'Failed to update order',
            data:order}, status: :unprocessable_entry
        end
      end

      def destroy
        order = Order.find(params[:id])
        order.destroy
        render json: {status:'SUCCESS', message:'Destroyed order',data:order}, status: :ok
      end

      private
      def order_params
        params.permit(:price,:status,:consumer_id,:serviceprovider_id,items: [:name,:quantity,:price,:order_id])
      end

      def orderitem_params
        params.permit(items: [:name,:quantity,:price,:order_id])
      end

    end
  end
end