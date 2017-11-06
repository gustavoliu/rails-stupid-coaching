class QuestionsController < ApplicationController

  NAMES = ["little boy", "grasshopper", "shlumbag", "green onion", "fudgy slime",
          "my padawan", "man-to-be", "wannabe warrior", "whitebelt", "rubber duck",
          "no-arms-bo", "tummytubby"]

  def coach_answer(your_message)
    your_message.rstrip! # removes whitespace in the end of the message

    if your_message == "I am going to work right now!"
      return "Now we are talking, #{NAMES.sample}! A good day of work strenghens the body and dignifies the soul!"
    elsif your_message.end_with?("?")
      return "Silly question, #{NAMES.sample}! Get dressed and go to work!"
    else
      return "I don't care, #{NAMES.sample}! Get dressed and go to work!"
    end
  end

  def coach_answer_enhanced(your_message)
    if your_message == "I am going to work right now!".upcase
      return "Yes, #{NAMES.sample}! Now I hear you!"
    else
      return "I can feel your motivation, #{NAMES.sample}! #{coach_answer(your_message)}"
    end
  end

  def define_coach_answer(your_message)
    if your_message == your_message.upcase
      coach_answer_enhanced(your_message)
    else
      coach_answer(your_message)
    end
  end

  def answer
    @query = params[:query]
    @answer = define_coach_answer(@query)
  end

  def ask
  end

end
