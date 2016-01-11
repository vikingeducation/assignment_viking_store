class Admin::AddressesController < AdminController
  layout 'admin'
  before_action :set_user, except: [:all_addresses]
  before_action :set_address, only: [:show, :edit, :update, :destroy]
  before_action :set_states, only: [:new, :create, :edit, :update]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_params

  def all_addresses
    # TODO: fix last checkout_date N+1 query
    @addresses = Address.includes(:city, :state, :user)
    @counts = Order.completed.group(:shipping_id).count
  end

  def index
    # TODO: fix last checkout_date N+1 query
    @addresses = @user.addresses.includes(:city, :state)
    @counts = @user.orders.completed.group(:shipping_id).count
  end

  def show
  end

  def new
    @address = @user.addresses.new
  end

  def create
    @address = @user.addresses.new(address_params)
    city = City.find_or_create_by(name: params[:address][:city_name])
    @address.city_id = city.id

    if @address.save
      redirect_to admin_user_addresses_url(@user), notice: 'Address successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @address.assign_attributes(address_params)
    city = City.find_or_create_by(name: params[:address][:city_name])
    @address.city_id = city.id

    if @address.save
      redirect_to admin_user_addresses_url(@user), notice: 'Address successfully saved.'
    else
      render :edit
    end
  end

  def destroy
    if @user.addresses.destroy(@address)
      redirect_to admin_user_addresses_url(@user), notice: "Address successfully destroyed."
    else
      redirect_to admin_user_addresses_url(@user), alert: "Address could not be destroyed."
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_address
    @address = Address.find(params[:id])
  end

  def set_states
    @states = State.order(:abbreviation)
  end

  def invalid_params
    redirect_to admin_addresses_path, alert: 'The page you attempted to view could not be found.'
  end

  def address_params
    params.require(:address).permit(:street_address, :secondary_address, :state_id, :zip_code)
  end
end