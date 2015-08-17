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
end
