class BlipsController < ApplicationController

  #before_action :find_sentence

  def create
    @sentence = Sentence.find params[:sentence_id]
    @blip = Blip.new blip_params
    @blip.sentence = @sentence
    @blip.user_id = current_user.id

    if @blip.save
      flash[:success] = "Blip created successfully"
      redirect_to root_path
    else
      flash[:alert] = "Your blip was not created"
      redirect_to root_path
    end
  end


  def destroy

  end

  private

  def blip_params
     params.require(:blip).permit(:body, {user_blips: []})
  end

  # def find_sentence
  #   @sentence = Sentence.find params[:id]
  # end

end
