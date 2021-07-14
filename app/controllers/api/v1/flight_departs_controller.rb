class Api::V1::FlightDepartsController < ApplicationController
    def index
        @flight_departs = FlightDepart.all
        render json: @flight_departs
      end
    
      def create
        @flight_depart = User.find_by(id: flightdepart_params[:user_id])
        @flight_depart.save
       
      end
    
      def show 
        @flight_depart = Flightdepart.find(params[:id])
        if @flight_depart
          render json: @flight_depart
        else 
          render json: { error: 'That flightdepart does not exist'}, status: :not_acceptable
        end
      end
    
      # def edit 
      #   @flightdepart = flightdepart.find(params[:id])
      #   if @flightdepart
      #     render json: @flightdepart 
      #   else 
      #     render json: { error: 'That flightdepart does not exist'}, status: :not_acceptable
      #   end
      # end
    
      def update
        @flightdepart = flightdepart.find(params[:id])
        @flightdepart.update(flightdepart_params)
        render json: @flightdepart 
      end
    
      def destroy
        @flightdepart = flightdepart.find(params[:id])
        if @flightdepart 
          @flightdepart.destroy 
          render json: {message: "flightdepart successfully deleted"}
        else 
          render json: {message: 'Could not destroy flightdepart'}, status: :not_acceptable
        end
      end
      
    
      private
    
      def flightdepart_params
        params.require(:flight_depart).permit(:user_id, :flightno)
      end
end
