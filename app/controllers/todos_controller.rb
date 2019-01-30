class TodosController < ApplicationController

  layout 'application'

  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.completed = false
    @todo.save
    redirect_to todos_path
  end

  def list
    @todos = Todo.all
    @todoscompleted = Todo.where(completed: true)
    @todosnotcompleted = Todo.where(completed: false)
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    @todo.completed = false
    @todo.update(todo_params)

    redirect_to todos_path
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to todos_path
  end

  def complete
    @todo = Todo.find(params[:id])
    @todo.completed = true
    @todo.save
    redirect_to todos_path
  end

  private

  def todo_params
    params.require(:todo).permit(:description, :completed)
  end
end
