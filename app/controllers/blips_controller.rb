class BlipsController < ApplicationController

  def create
    @blip ||= Blip.new blip_params
    user = current_user
    user.blips << @blip
    @sentence = Sentence.find params[:sentence_id]
    @blip.sentence = @sentence

    # make this now output json:

    # {statistics: [
    #  {word: "butts", frequency: "95%"},
    #  {word: "dogs", frequency: "2%"},
    #  {word: "vegetables", frequency: "1%"},
    #  {word: "sun", frequency: "2%"}
    # ]}

    if @blip.save
      @blip.increment!(:count)
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
