class SentencesController < ApplicationController


  def new
    @sentence = Sentence.new
  end

  def create
    @sentence = Sentence.new sentence_params
    #@sentence.user = current_user
    if @sentence.save
      flash[:success] = "Sentence successfully created."
      redirect_to sentences_path
    else
      flash.now[:alert] = "Sentence was not created!"
      render :new
    end
  end

  def index
    @blips = Blip.all
    if current_user
      @sentences = Sentence.all - current_user.sentences
    else
      @sentences = Sentence.all 
    end
    #.blips.users.where(:user_id != current_user.id)
    # All Sentences where blip.users sentence_id is not present
  end

  def destroy
    @sentence.destroy
    flash[:success] = "Sentence successfully deleted."
    redirect_to root_path
  end

  def edit
    
  end

  
  private
  
  def sentence_params
     params.require(:sentence).permit(:body, { tag_ids:[] })
  end

  def find_sentence
    @sentence = Sentence.find params[:id]
  end

end
