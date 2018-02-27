class TodoItemsController < ApplicationController
  before_action :set_todo_list

   def create 
      @todo_item = @todo_list.todo_items.create(todo_item_params)
      redirect_to @todo_list 
  end 

  def destroy
    @todo_item = @todo_list.todo_items.find(params [:id])
      if @todo_item.destroy
        flash [:success] = "Todo Item is gone"
      else 
        flash[:error] = "Cannot delete todo item"
  end 
  redirect_to @todo_list
 end 

  private

  def set_todo_list
    @todo_list = TodoList.find(params[:todo__list_id])
  end 

  def todo_item_params
    params[:todo_item].permit(:content)
  end 

end
