class NotesController < ApplicationController
  def new
    if request.xhr?
      @note = Note.new
      render partial: 'new', layout: false, locals: { note: @note }
    end
  end

  def create
    @note = Note.new( note_params )

    if @note.save
      redirect_to user_path( current_user )
    end
  end

  def destroy
    if request.xhr?
      note = Note.find( params[ :note ][ :id ] )
      if note.destroy
        render partial: "true", layout: false, locals: { id: params[ :note ][ :id ] }
      end
    end
  end


    private

      def note_params
        params.require( :note ).permit( :user_id, :body )
      end
end
