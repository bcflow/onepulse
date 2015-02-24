class BlipsController < ApplicationController

  def create
    @blip = Blip.new blip_params
    user = current_user
    user.blips << @blip
    @sentence = Sentence.find params[:sentence_id]
    @blip.sentence = @sentence
    

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
