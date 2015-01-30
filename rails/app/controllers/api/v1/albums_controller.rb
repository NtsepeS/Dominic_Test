module Api
  module V1
    class AlbumsController < AuthenticatedController

      def index
        albums = Album.all
        render json: albums
      end

      def show
        album = Album.find(params[:id])
        render json: album
      end

      def update
        album = Album.find(params[:id])
        album.update_attributes(album_params)
        render json: album
      end

      def destroy
        album = Album.find(params[:id])
        album.destroy
        render json: album
      end

      private

      def album_params
        params.fetch(:album, params).permit(:name)
      end

    end
  end
end
