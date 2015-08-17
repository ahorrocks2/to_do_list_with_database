require('spec_helper')
require('pry')

describe(Task) do
  describe(".all") do
    it("leaves list empty at first") do
      expect(Task.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a task to the array of saved tasks") do
      test_task = Task.new({:description => 'learn SQL', :due_date => '2015-08-24 00:00:00', :list_id => 1})
      test_task.save()
      expect(Task.all.first).to(eq(test_task))
    end
  end

  describe("#description") do
    it('lets you read the description out') do
        test_task = Task.new({:description => 'eat tacos', :due_date => '2015-08-24 00:00:00', :list_id => 1})
        expect(test_task.description()).to(eq('eat tacos'))
    end
  end

  describe('#list_id') do
    it('lets you read the list ID out') do
      test_task = Task.new({:description => 'eat tacos', :due_date => '2015-08-24 00:00:00', :list_id => 1})
      expect(test_task.list_id()).to(eq(1))
    end
  end

  describe('#due_date') do
    it('returns the due date of the task') do
      test_task = Task.new({:description => 'eat tacos', :due_date => '2015-08-24 00:00:00', :list_id => 1})
      expect(test_task.due_date()).to(eq('2015-08-24 00:00:00'))
    end
  end

  describe('#==') do
    it('is the same task if it has the same description') do
      task1 = Task.new({:description => 'learn SQL', :due_date => '2015-08-24 00:00:00', :list_id => 1})
      task2 = Task.new({:description => 'learn SQL', :due_date => '2015-08-24 00:00:00', :list_id => 1})
      expect(task1).to(eq(task2))
    end
  end

  describe('.by_list') do
    it('returns an array of Task objects sharing a list id') do
      task1 = Task.new({:description => 'wash tacocat', :due_date => '2015-08-16 00:00:00', :list_id => 1})
      task2 = Task.new({:description => 'scrub the zebra', :due_date => '2015-08-17 00:00:00', :list_id => 1})
      task3 = Task.new({:description => 'reassemblar el coche de safari', :due_date => '2015-08-18', :list_id => 2})
      task1.save
      task2.save
      task3.save
      expect(Task.by_list(1)).to(eq([task1, task2]))
    end
  end

  describe('.order_list') do
    it('orders the tasks based on their due date') do
      task1 = Task.new({:description => 'push the donkey', :due_date => '2015-08-24 00:00:00', :list_id => 2})
      task2 = Task.new({:description => 'pet the lion', :due_date => '2015-08-18 00:00:00', :list_id => 2})
      task3 = Task.new({:description => 'kill the stag', :due_date => '1942-08-23 00:00:00', :list_id => 2})
      task1.save
      task2.save
      task3.save
      expect(Task.order_list(2)).to(eq([task3, task2, task1]))
    end
  end
end
