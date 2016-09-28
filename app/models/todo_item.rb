class TodoItem < ActiveRecord::Base
  def self.com_todo_item
    TodoItem.where(completed: true).count
  end
end
