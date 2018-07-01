require 'rails_helper'

RSpec.describe List, type: :model do
  describe '#complete_all_tasks!' do
    it 'should mark all tasks from the list as complete' do
      list = List.create(name: "Chores")
      task_1 = Task.create(complete: false, list_id: list.id, name: "Fight a possum")
      task_2 = Task.create(complete: false, list_id: list.id, name: "Fight a racoon")
      list.complete_all_tasks!

      list.tasks.each do |task|
        expect(task.complete).to eq(true)  
      end
    end
  end

  describe '#snooze_all_tasks!' do
    it 'should push all of the deadlines back one hour' do
      list = List.create(name: "Stuff to do")
      right_now = Time.now
      task_1 = Task.create(deadline: right_now, list_id: list.id, name: "Fight a possum")
      task_2 = Task.create(deadline: right_now, list_id: list.id, name: "Fight a giraffe")
      list.snooze_all_tasks!

      list.tasks.each do |task|
        expect(task.deadline).to eq(right_now + 1.hour)
      end
    end
  end

  describe '#total_duration' do
    it 'should add all of the task durations and return the sum' do
      list = List.create(name: "What up")
      Task.create(duration: 10, list_id: list.id, name: "Fight a possum")
      Task.create(duration: 30, list_id: list.id, name: "Fight a racoon")
      
      expect(list.total_duration).to eq(40)
    end
  end

  describe '#incomplete_tasks' do
    it 'should put all of the tasks with complete of false into a new array and return that array' do
      list = List.create(name: "Bucket List")
      task_1 = Task.create(complete: false, list_id: list.id, name: "Fight a possum")
      task_2 = Task.create(complete: false, list_id: list.id, name: "Fight a racoon")
      task_3 = Task.create(complete: true, list_id: list.id, name: "Fight a hippo") 
      expect(list.incomplete_tasks).to match_array([task_1, task_2])
    end
  end

  describe '#favorite_tasks' do
    it 'should display all of the tasks with favorite as true' do
      list = List.create(name: "Bucket List")
      task_1 = Task.create(favorite: true, list_id: list.id, name: "Fight a possum")
      task_2 = Task.create(favorite: true, list_id: list.id, name: "Fight a racoon")
      task_3 = Task.create(favorite: false, list_id: list.id, name: "Fight a hippo")
      expect(list.favorite_tasks).to match_array([task_1, task_2])
    end
  end
end
