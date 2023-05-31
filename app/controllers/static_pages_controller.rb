require 'flickr'

class StaticPagesController < ApplicationController
    def index
        if params[:id]
            begin 
            flickr = Flickr.new( Figaro.env.flickr_key, Figaro.env.flickr_secret )
            photos_list = flickr.people.getPublicPhotos(user_id: params[:id])

            @photos = photos_list.map { |photo| Flickr.url(photo) } 
            rescue
                redirect_to root_url
            end
        end
    end
end
