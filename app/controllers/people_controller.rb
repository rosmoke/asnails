class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @people = Person.all
    respond_with(@people)
  end

  def show
    respond_with(@person)
  end

  def new
    @person = Person.new
    respond_with(@person)
  end

  def edit
  end

   # POST /users
  # POST /users.json
  def create
    @person = Person.new(person_params)
    
    respond_to do |format|
      if @person.save
        # Tell the UserMailer to send a welcome email after save
        PersonMailer.welcome_email(@person).deliver
 
        format.html { redirect_to(@person, notice: 'Person was successfully created.') }
        format.json { render json: @person, status: :created, location: @person }
      else
        format.html { render action: 'new' }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
  end
end

  def update
    @person.update(person_params)
    respond_with(@person)
  end

  def destroy
    @person.destroy
    respond_with(@person)
  end

  private
    def set_person
      @person = Person.find(params[:id])
    end

    def person_params
      params.require(:person).permit(:name, :email, :login)
    end
end
