class FieldsController < ApplicationController
  def update
    if request.xhr?
      position = params[ "pos" ]

      if current_user.fields[ 0 ][ "#{ position }" ] == "inactive"
        current_user.fields[ 0 ].update_attributes( "#{ position }": "active" )
        render partial: 'check', locals: { pos: position }
      else
        current_user.fields[ 0 ].update_attributes( "#{ position }": "inactive" )
        render partial: 'uncheck', locals: { pos: position }
      end
    end
  end
end
