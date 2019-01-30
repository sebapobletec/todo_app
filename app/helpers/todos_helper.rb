module TodosHelper
  def completed_in_words(todo)
    if todo.completed
      return "Yes"
    else
      return "No"
    end
  end
end
