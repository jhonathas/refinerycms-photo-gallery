module Refinery
  module PhotoGallery
    module PhotoGalleryHelper

      def message_albums_length_is_zero
        if @albums.length == 0
          t('.no_albums')
        end
      end

      def message_photos_length_is_zero
        if @photos.length == 0
          t('.no_photos')
        end
      end

      def message_collections_length_is_zero
        if @collections.length == 0
          t('.no_collections')
        end
      end



      def generate_photo_gallery_menu( collections, albums, options = {} )
        content_tag(:ul, {}, options[:ul] ) do
          collections.each do |collection|

            if params[:collection_id].present? &&  params[:id].present? # in albums controller
              collection_id = params[:collection_id]
            elsif params[:id].present? #in collection controller
              collection_id = params[:id]
            else
              collection_id = 0 #only ensure initialization
            end

            concat(content_tag(:li, {:style => 'list-style-type: none;
                                                text-align:center;
                                                font-size: 1.89em;'}, options[:li]) do
              concat(link_to (collection.title + " <span style='font-size: .89em; font-style: italic;'>
                              (#{collection.updated_at.strftime('%B %d')})</span>").html_safe,
                     refinery.photo_gallery_collection_path(collection))

              # display albums of active collection
              concat(
                content_tag(:table, :class => 'table table-hover table-striped table-bordered', :style => 'margin-top: 25px;') do

                if collection_id  == collection.id.to_s
                  albums.each do |album|
                    concat(
                      content_tag(:tr) do
                        concat(
                          # album cover
                          content_tag(:td, :style => 'width: 150px;') do
                            concat(
                              link_to image_tag(album.photos.first.file.album.url),
                                refinery.photo_gallery_collection_album_path({:id=> album.id,
                                                                             :collection_id => collection_id})
                            )
                          end
                        )
                        # album info
                        concat(
                          content_tag(:td) do
                            concat(
                              content_tag(:ul) do
                                concat(
                                  content_tag(:li, :style => 'list-style-type: none;') do
                                    concat(
                                      content_tag(:h3, :style => 'font-size: .75em') do
                                        concat(
                                          link_to album.title, refinery.photo_gallery_collection_album_path({:id=> album.id, :collection_id => collection_id})
                                        )
                                      end
                                    )
                                  end
                                )
                                concat(
                                  content_tag(:li, "Description", :style => 'list-style-type: none; font-size: 15px; font-style: italic;')
                                )
                                concat(
                                  content_tag(:li, :style => 'list-style-type: none; font-size: 18px;') do
                                    concat(
                                      album.description
                                    )
                                  end
                                )
                                concat(
                                  content_tag(:li, :style => 'list-style-type: none; font-size: 15px; text-align: right;') do
                                    concat(
                                      link_to 'View Album', refinery.photo_gallery_collection_album_path({:id=> album.id, :collection_id => collection_id}),
                                        :class => 'btn btn-small btn-info'
                                    )
                                  end
                                )
                              end
                            )
                          end
                        )
                      end
                    )
                  end
                end
              end )


            end)
          end
        end
      end
    end
  end
end
