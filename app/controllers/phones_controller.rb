class PhonesController < ApplicationController
  def index
  	@p=Phone.new
  end

  def create
  	@p=Phone.new(phone_params)
  	p = TelephoneNumber.parse(@p.number)
  	response=[]
  	h=Hash.new
  	if p.valid?
  		h[:country]=p.country.country_code
  		response<<h
  	else
  		h[:errorMessage]="Invalid Phone number"
  		response<<h
  	end
  	return render json: response
  end

  def api
  	p = TelephoneNumber.parse(params[:phoneNumber])
  	response=[]
  	h=Hash.new
  	if p.valid?
  		h[:country]=p.country.country_code
  		response<<h
  	else
  		h[:errorMessage]="Invalid Phone number"
  		response<<h
  	end
  	return render json: response
  end

  private

  def phone_params
  	params.require(:phone).permit(:number)
  end

end
