class Task

  define_method(:initialize) do |description|
    @description = description
  end

  define_method(:description) do
    @description
  end

  define_method(:==) do |another_task|
    self.description().==(another_task.description())
  end

  define_singleton_method(:all) do
    returned_tasks = DB.exec("SELECT * FROM tasks;")
    tasks =[]
    return_tasks.each() do |task|
      description = task.fetch("description")
      task.push(Task.new({:description => description}))
    end
    tasks
  end

  define_method(:save) do
    @@all_tasks.push(self)
  end

  define_singleton_method(:clear) do
    @@all_tasks = []
  end


end
