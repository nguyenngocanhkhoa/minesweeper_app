class BoardsController < ApplicationController
    before_action :set_board, only: [:show]
  
    def index
      @board = Board.new
      @boards = Board.order(created_at: :desc).limit(10)
    end
  
    def create
      @board = Board.new(board_params)
      if @board.save
        @board_grid = @board.generate_board
        redirect_to @board
      else
        render :index
      end
    end
  
    def show
      @board_grid = @board.generate_board
    end
  
    private
  
    def set_board
      @board = Board.find(params[:id])
    end
  
    def board_params
      params.require(:board).permit(:name, :email, :width, :height, :mines)
    end
  end
  