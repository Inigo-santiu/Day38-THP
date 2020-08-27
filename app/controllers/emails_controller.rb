class EmailsController < ApplicationController
  def index
    @emails = Email.all.order("created_at DESC")
  end

  def create
    @email = Email.create(object: Faker::Movies::HitchhikersGuideToTheGalaxy.character, body: Faker::TvShows::RickAndMorty.quote)

      respond_to do |format|
      format.html {redirect_to root_path}
      format.js {}
      end
    
  end

  def show
    @email = Email.find(params[:id])

    respond_to do |format|
      format.html {redirect_to root_path}
      format.js {}
      end
  end

  def update
    @email = Email.find(params[:id])
    if update_emails_params == nil
      @email.read = false
    end
    @email.update(update_params)

    respond_to do |format|
      format.html {redirect_to root_path}
      format.js {}
    end    
  end


  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    respond_to do |format|
      format.html {redirect_to root_path}
      format.js {}
    end
  end

private
  def email_params
    params.permit(:object, :body)
  end

  def update_emails_params
    update_params[:read]
  end

  def update_params
    params.permit(:read, :id)
  end

end