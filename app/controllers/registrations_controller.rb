class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    user = User.new( create_params )

    if user.first_name != nil
      user.type_ep = "Full Time / Part Time"
    end

    if user.save
      sign_in( :user, user )

      if user.role == "A Job"
        Full.create( sunday: "inactive", monday: "inactive", tuesday: "inactive", wednesday: "inactive", thursday: "inactive", friday: "inactive", saturday: "inactive", user_id: current_user.id )
      else
        Full.create( sunday: "inactive", monday: "inactive", tuesday: "inactive", wednesday: "inactive", thursday: "inactive", friday: "inactive", saturday: "inactive", user_id: current_user.id )
        Field.create( pharmacist: "inactive", intern: "inactive", technician: "inactive", cashier: "inactive", user_id: current_user.id )
      end

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
