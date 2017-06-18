class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    user = User.new( create_params )

    if user.save
      sign_in( :user, user )
      redirect_to user_path( user )
    end
  end

  def update
    super
  end

  def edit
    super
  end

  def destroy
    super
  end

    private

      def create_params
        params.require( :user ).permit( :first_name, :last_name, :pharmacy_name, :role, :password, :password_confirmation, :email, :alias )
      end
end
