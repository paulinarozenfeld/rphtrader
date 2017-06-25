class UsersController < ApplicationController
  def show
    if current_user.id != params[ "id" ].to_i
      redirect_to root_path
    end

    @user = current_user
    @date = params[ :date ] ? Date.parse( params[ :date ] ) : Date.today

    if current_user.role == "A Job"
      @dates_per_diem = []

      if current_user.zip != ""
        @latlon = current_user.zip.to_latlon.split( ", " )
      end

      if current_user.range != nil
        @meters = current_user.range * 1609.344
      end

      if current_user.type_ep == "Per Diem"
        current_user.events.each { | event | @dates_per_diem << event }
      else
        @days = [ 'sunday', 'monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday' ]
        @sched = current_user.fulls[ 0 ]
      end
    else
      @days = [ 'sunday', 'monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday' ]
      @sched = current_user.fulls[ 0 ]
      @job_checks = current_user.fields[ 0 ]
      @notes = current_user.notes.sort
    end
  end

  def update
    if request.xhr?
      current_user.update_attributes( update_params )

      if params[ :user ][ :type_ep ] == "Full Time / Part Time"
        render partial: 'full'
      else
        render partial: 'diem'
      end
    else
      current_user.update_attributes( update_nojs_params )
      redirect_to user_path( current_user )
    end
  end

    private

      def update_params
        params.require( :user ).permit( :type_ep )
      end

      def update_nojs_params
        params.require( :user ).permit( :first_name, :last_name, :mobile, :email, :position, :codename, :zip, :range )
      end
end
