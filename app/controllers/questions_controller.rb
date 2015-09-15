class QuestionsController < ApplicationController
	def index
		@questions = Question.all
	end

	def new
		@question = Question.new
	end


	def create
		@question = Question.new(question_params)

		if @question.save
			flash[:notice] =  'Question Successfully Added!'
			redirect_to @question
		else
			render :new
		end
	end

	def show
		@question = Question.find(params[:id])
		@answers = @question.answers

	end

	def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to @question, notice: "Question Successfully Updated!"
    else
      render :action => :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:notice] = 'question deleted.'
    redirect_to '/questions'
  end

  private

  def question_params
    params.require(:question).permit(:title, :description)
  end


end
