class FullsController < ApplicationController
  def update
    if request.xhr?
      full = Full.find( params[ :fullsId ] )
      day = params[ :day ].downcase

      if full[ day ] == "inactive"
        full.update_attributes( "#{ day }" => "active" )
        render partial: 'fulls/green'
      else
        full.update_attributes( "#{ day }" => "inactive" )
        render partial: 'fulls/white'
      end
    end
  end
end
