class BlipsController < ApplicationController

  def create
    user = current_user
    @blip = Blip.new blip_params
    @sentence = Sentence.find params[:sentence_id]
    @blip.sentence = @sentence
    user.blips << @blip

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
     params.require(:blip).permit(:body, :sentence_id)
  end

  # def find_sentence
  #   @sentence = Sentence.find params[:id]
  # end

end
