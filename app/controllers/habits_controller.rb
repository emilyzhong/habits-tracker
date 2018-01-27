class HabitsController < ApplicationController
    def index
        @habits = Habit.all
    end

    def show
        @habit = Habit.find(params[:id])
    end
    
    def new
    end

    def edit
    end

    def create
        @habit = Habit.new(habit_params)

        @habit.save
        redirect_to @habit
    end

    def update
        @habit = Habit.find(params[:id]);

        if @habit.days <= 1
            @habit.update(days: 0);
        else
            @habit.update(days: (@habit.days - 1))
            redirect_to @habit
        end
    end

    def destroy
        @habit = Habit.find(params[:id])
        @habit.destroy
 
        redirect_to action: "index"
    end

    private 
        def habit_params 
            params.require(:habit).permit(:title, :days)
        end
end
