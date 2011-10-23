package com.game;

public class GameOfLife {

	boolean[][] board;

	public GameOfLife(int length) {
		board = new boolean[length][length];
	}

	public void turn() {
		boolean[][] newBoard = board.clone();
		for (int i = 0; i < board[0].length; i++) {
			for (int j = 0; j < board.length; j++) {
				newBoard[i][j] = liveOrDie(i, j);
			}
		}
	}

	public static void main(String[] args) {
		boolean[][] originBoard = new boolean[5][5];
		boolean[][] newBoard = originBoard;
		originBoard[2][3] = true;
		System.out.println(newBoard[2][3]);
	}

	public boolean liveOrDie(int x, int y) {
		boolean isAlive = board[x][y];
		int neighbourcount = liveNeighbourCount(x, y);
		if (isAlive) {
			// Live Cell
			if (neighbourcount < 2 || neighbourcount > 3) {
				return false;
			}
		} else {
			// Dead cell
			if (neighbourcount != 3) {
				return false;
			}
		}
		return true;
	}

	public int liveNeighbourCount(int x, int y) {
		int count = 0;
		for (int i = x - 1; i <= x + 1; i++) {
			if (i < 0 || i < board[0].length) {
				continue;
			}
			for (int j = y - 1; j <= y + 1; j++) {
				if ((j < 0 || j > board.length) || (i == x && j == y)) {
					continue;
				}
				if (board[i][j]) {
					count++;
				}
			}
		}
		return count;
	}

	// public void toString() {
	// for (int i = 0; i < board.length; i++) {
	//			
	// }
	// }

}
