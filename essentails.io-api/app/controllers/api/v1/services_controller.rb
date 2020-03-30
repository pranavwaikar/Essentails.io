module Api
  module V1
    class ServicesController < ApplicationController

      def index
        services = Service.order("created_at DESC")
        render json: {status:'SUCCESS', message:'Loaded service',data:services}, status: :ok
      end

      def create
        service = Service.new(service_params)
        if service.save
          render json: {status:'SUCCESS', message:'Created service',data:service}, status: :ok
        else
          render json: {status:'FAILURE', message:'Failed to create service',
            data:service.errors}, status: :unprocessable_entry
        end
      end

      def create_service_for_provider
        serviceprovider = Serviceprovider.find(params[:serviceprovider_id])
        service = serviceprovider.services.create(service_params)
        render json: {status:'SUCCESS', message:'Created service',data:service}, status: :ok
      end

      def show
        service = Service.find(params[:id])
        render json: {status:'SUCCESS', message:'Found service',data:service}, status: :ok
      end

      def update
        service = Service.find(params[:id])
        if (service.update_attributes(service_params))
          render json: {status:'SUCCESS', message:'updated service',data:service}, status: :ok
        else
          render json: {status:'SUCCESS', message:'Failed to update service',
            data:service}, status: :unprocessable_entry
        end
      end

      def destroy
        service = Service.find(params[:id])
        service.destroy
        render json: {status:'SUCCESS', message:'Destroyed service',data:service}, status: :ok
      end

      private
      def service_params
        params.permit(:name,:price,:unit,:max_order_limit,:out_of_stock,:serviceprovider_id)
      end

    end
  end
end