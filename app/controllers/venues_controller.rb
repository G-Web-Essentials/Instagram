class VenuesController < ApplicationController
    before_action :set_venue, only: [:show, :destroy]
    
    def index
        if params[:search_query].present?
            @venues = Venue.where("username LIKE ?", "%#{params[:search_query]}%")
        else
            @venues = []
        end
        
        if turbo_frame_request?
            render partial: "layouts/shared/search_results", locals: {venues: @venues}
        end
    end
    
    def show
        
    end
    
    def destroy
        
        if @venue.animals.count >= 1
             @venue.animals.each do |a|
                a.venue_id = nil
                a.save
                a.reload
             end
             @venue.destroy
            respond_to do |format|
                if @venue.destroy
                    format.html { redirect_to root_path, notice: "Venue was successfully destroyed." }
                else
                    format.html { redirect_to root_path, notice: "Venue was not destroyed." }
                end
            end
        else
              @venue.destroy
                respond_to do |format|
                    if @venue.destroy
                        format.html { redirect_to root_path, notice: "Venue was successfully destroyed." }
                    else
                        format.html { redirect_to root_path, notice: "Venue was not destroyed." }
                    end
                end
        end 
    end
        
    
    
    
    private
    def set_venue
       @venue = Venue.find(params[:id]) 
    end
end