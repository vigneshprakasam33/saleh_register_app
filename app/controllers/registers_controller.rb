class RegistersController < ApplicationController

  before_action :check_session, :only => [:welcome, :question, :picture]

  #######################################################################################
  def login
    @title = "-- login --"
    if request.post?
      register = Register.find_by_username_and_password(params[:register][:username], params[:register][:password])
      if register
        session[:user_id] = register.id
        flash[:notice] = "User( #{session[:user_id]} ) (#{register.id}) #{register.username} logged in!"
        redirect_to registers_question_path
      else
        # Don't show the password in the view.
        @register = Register.new
        flash[:notice] = "Invalid username/password combination"
      end
    end
  end

  #######################################################################################
  def picture
    @title = "-- Picture Test Page --"
  end

  #######################################################################################
  def signup
    @title = "-- Signup Page --"

    if request.post?
      @register = Register.new()
      @register.username = params[:register][:username]
      @register.password = params[:register][:password]
      @register.q1 = params[:register][:q1]
      @register.q2 = params[:register][:q2]
      @register.q3 = params[:register][:q3]
      @register.state=1;


      if @register.save
        session[:user_id] = @register.id
        flash[:notice] = "User #{@register.username} created!"
        redirect_to :action => "login"
      else
        flash[:notice] = @register.errors.full_messages
      end
    end
  end

  #######################################################################################
  def logout
    @title = "-- Logout Page --"
    session[:user_id] = nil
    flash[:notice] = " "
  end

  #######################################################################################
  def question
    @title = "-- Question Page --"
    @question=rand(0..3)
  end


  def submit_question
    @answer = params[:register][:answer]
    @question_id = params[:register][:question_id]
    @register = Register.find(session[:user_id])
    count =@register.failure_counts
    answerfetched=checkAnswer(session[:user_id], @question_id)

    if (answerfetched[0] == @answer && count<3)
      redirect_to registers_welcome_path
    elsif (answerfetched[0]!= @answer&& count<3)
      @register.update(:failure_counts => count + 1)
      flash[:notice] = "Wrong answer, please try again!"
      redirect_to registers_question_path
    else
      flash[:notice] = "Maximum attempts exhausted!"
      redirect_to registers_picture_path
    end
  end

#######################################################################################
  def checkAnswer(id, qnumber)

    case qnumber
      when 0
        Register.find_by_id(id.to_s).q1
      when 1
        Register.find_by_id(id.to_s).q2
      else
        Register.find_by_id(id.to_s).q3
    end

  end

#######################################################################################
  def welcome
    @title = "-- Welcome Page --"
  end

  def check_session
    if session[:user_id].blank?
      flash[:notice] = "You are not logged in"
      redirect_to registers_login_path
    end
  end


end