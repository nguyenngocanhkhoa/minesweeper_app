class Board < ApplicationRecord

    def generate_board
      board = Array.new(height) { Array.new(width, 0) }
      
      # Thêm mìn vào bảng
      placed_mines = 0
      while placed_mines < mines
        x = rand(height)
        y = rand(width)
        
        if board[x][y] != "X"
          board[x][y] = "X"
          placed_mines += 1
        end
      end
  
      (0...height).each do |x|
        (0...width).each do |y|
          next if board[x][y] == "X"
          board[x][y] = count_mines_around(board, x, y)
        end
      end
  
      board
    end
  
    def count_mines_around(board, x, y)
      directions = [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]]
      count = 0
      directions.each do |dx, dy|
        nx, ny = x + dx, y + dy
        count += 1 if nx >= 0 && nx < height && ny >= 0 && ny < width && board[nx][ny] == "X"
      end
      count
    end
  end
  