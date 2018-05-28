module Api::V1
  class AlbumsController < ApiController

    def index
      if params[:location_id]
        albums = Album.where(:location_id => params[:location_id])
      else
        albums = Album.all
      end

      respond_to do |format|
        format.json {
          render :json => albums
        }
      end
    end

    def show
      respond_to do |format|
        format.json {
          render :json => Album.find(params[:id])
        }
      end
    end

    def create
      album = Album.new album_params

      respond_to do |format|
        if album.save
          format.json {
            render :json      => album,
                   :status    => :created
          }
        else
          format.json {
            render :json   => album.errors,
                   :status => :unprocessable_entity
          }
        end
      end
    end

    def update
      album = Album.find(params[:id])

      respond_to do |format|
        if album.update
          format.json {
            render :json      => album,
                   :status    => :updated
          }
        else
          format.json {
            render :json   => album.errors,
                   :status => :unprocessable_entity
          }
        end
      end
    end

    def destroy
      album = Album.find(params[:id])
      album.destroy

      head :no_content
    end

    private

    def album_params
      params.require(:album)
            .permit(Album::PARAMS)
    end
  end
end
