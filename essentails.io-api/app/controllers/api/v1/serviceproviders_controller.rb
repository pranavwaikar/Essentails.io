module Api
  module V1
    class ServiceprovidersController < ApplicationController

      def index
        serviceproviders = Serviceprovider.order("created_at DESC")
        render json: {status:'SUCCESS', message:'Loaded serviceproviders',data:serviceproviders}, status: :ok
      end

      def create
        serviceprovider = Serviceprovider.new(serviceprovider_params)
        if serviceprovider.save
          render json: {status:'SUCCESS', message:'Created serviceprovider',data:serviceprovider}, status: :ok
        else
          render json: {status:'FAILURE', message:'Failed to create serviceprovider',
            data:serviceprovider.errors}, status: :unprocessable_entry
        end
      end

      def show
        serviceprovider = Serviceprovider.find(params[:id])
        render json: {status:'SUCCESS', message:'Found serviceprovider',data:serviceprovider}, status: :ok
      end

      def show_my_services
        serviceprovider = Serviceprovider.find(params[:id])
        services = serviceprovider.services
        render json: {status:'SUCCESS', message:'Found all services by serviceprovider',data:services}, status: :ok
      end

      def get_orders
        serviceprovider = Serviceprovider.find(params[:id])
        orders = serviceprovider.orders
        render json: {status:'SUCCESS', message:'Found all orders by serviceprovider',data:orders}, status: :ok
      end

      def update
        serviceprovider = Serviceprovider.find(params[:id])
        if (serviceprovider.update_attributes(serviceprovider_params))
          render json: {status:'SUCCESS', message:'updated serviceprovider',data:serviceprovider}, status: :ok
        else
          render json: {status:'SUCCESS', message:'Failed to update serviceprovider',
            data:serviceprovider}, status: :unprocessable_entry
        end
      end

      def destroy
        serviceprovider = Serviceprovider.find(params[:id])
        serviceprovider.destroy
        render json: {status:'SUCCESS', message:'Destroyed serviceprovider',data:serviceprovider}, status: :ok
      end

      private
      def serviceprovider_params
        params.permit(:name,:email,:phone_number,:password,:area,:city,:state,:type_of_service)
      end

    end
  end
end