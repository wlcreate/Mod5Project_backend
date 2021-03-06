class ReflectionsController < ApplicationController
    before_action :authorized, only: [:create, :destroy, :update]

    def create
        # byebug
        place_id = params[:place_id]
        @place = Place.all.find(place_id)
        @reflection = @place.reflections.create(reflection_params)

        render json: {
                user: UserSerializer.new(@user), 
                chosen_place: PlaceSerializer.new(@place),
                reflection: ReflectionSerializer.new(@reflection)
            }
    end

    def destroy
        # byebug
        @reflection = Reflection.find(params[:id])
        # need to get the public id from the url to delete from Cloudinary
        if @reflection.media
            Cloudinary::Uploader.destroy(@reflection.media.split(".png")[0].split("/").last)
            @reflection.destroy
        else 
            @reflection.destroy
        end

        render json: {
            user: UserSerializer.new(@user), 
            reflection: ReflectionSerializer.new(@reflection)
        }
    end

    def update
        # byebug
        @reflection= Reflection.find(params[:id])
        @reflection.update(reflection_params)

        render json: {
            user: UserSerializer.new(@user), 
            reflection: ReflectionSerializer.new(@reflection)
        }
    end

    def add_media
        @reflection= Reflection.find(params[:id])

        media = Cloudinary::Uploader.upload(params[:media])
        # byebug
        @reflection.update(media: media["url"])

        render json: {
            user: UserSerializer.new(@reflection.place.trip.user),
            reflection: ReflectionSerializer.new(@reflection)
        }
    end

    private

    def reflection_params
        params.permit(:date_visited, :rating, :content)
    end

end
