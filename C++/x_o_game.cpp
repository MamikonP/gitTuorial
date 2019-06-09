#include <iostream>

#define Row_board 3
#define Col_board 3
#define symbol_x 'X'
#define symbol_o 'O'

char board_list[Row_board][Col_board];
char board_symbol = '*';

void init_board(char [Row_board][Col_board]);
void board(char board_list[Row_board][Col_board]);
void players(int, int, char);
char winner_diagonal_1(char board_list[Row_board][Col_board], char);
char winner_diagonal_2(char board_list[Row_board][Col_board], char);
char winner_rows(char board_list[Row_board][Col_board], char);
char winner_cols(char board_list[Row_board][Col_board], char);

int main()
{
	using namespace std;

	init_board(board_list);
	board(board_list);

	bool game = true;
	int row, col, count_symbols = 0;

	while (game)
	{
		bool pl1 = true;
		bool pl2 = true;
		while(pl1)
		{		
			cout << "Enter row(pl-1): ";
			cin >> row;
			cout << "Enter col(p-1): ";
			cin >> col;

			players(row, col, symbol_x);

			char finish_1 = winner_diagonal_1(board_list, symbol_x);
			cout << finish_1;
			if(finish_1 == symbol_x)
				return 0;
			
			char finish_2 = winner_diagonal_2(board_list, symbol_x);
			cout << finish_2;
			if(finish_2 == symbol_x)
				return 0;
			
			char finish_3 = winner_rows(board_list, symbol_x);
			cout << finish_3;
			if(finish_3 == symbol_x)
				return 0;

			char finish_4 = winner_cols(board_list, symbol_x);
			cout << finish_4;
			if(finish_4 == symbol_x)
				return 0;

			pl1 = false;
			++count_symbols;
		}

		if(count_symbols == sizeof(board_list))
		{
			game = false;
			cout << "The game is standoff" << endl;
			break;
		}

		while(pl2)
		{
			cout << "Enter row(pl-2): ";
			cin >> row;
			cout << "Enter col(p-2): ";
			cin >> col;

			players(row, col, symbol_o);

			char finish_1 = winner_diagonal_1(board_list, symbol_o);
			cout << finish_1;
			if(finish_1 == symbol_o)
				return 0;
			
			char finish_2 = winner_diagonal_2(board_list, symbol_o);
			cout << finish_2;
			if(finish_2 == symbol_o)
				return 0;

			char finish_3 = winner_rows(board_list, symbol_o);
			cout << finish_3;
			if(finish_3 == symbol_o)
				return 0;

			char finish_4 = winner_cols(board_list, symbol_o);
			cout << finish_4;
			if(finish_4 == symbol_o)
				return 0;

			pl2 = false;
			++count_symbols;
		}

	}

	return 0;
}

void init_board(char board_list[Row_board][Col_board])
{
	for(int i = 0; i < Row_board; i++)
		for(int j = 0; j < Col_board; j++)
			board_list[i][j] = board_symbol;
}

void board(char board_list[Row_board][Col_board])
{

	for(int i = 0; i < Row_board; i++)
		if(i == 0)
			std::cout << "N  " << i << "   ";
		else
			std::cout << i << "   ";

	std::cout << std::endl << std::endl;

	for(int i = 0; i < Row_board; i++)
	{
		std::cout << i << "  ";
		for(int j = 0; j < Col_board; j++)
			std::cout << board_list[i][j] << "   ";
		std::cout << std::endl << std::endl;
	}
}

void players(int row, int col, char symbol)
{
	bool player = true;
	while(player)
	{
		if(row >= 0 && row <= 2)
			if(col >= 0 && col <= 2)
				if(board_list[row][col] == '*')
				{
					board_list[row][col] = symbol;
					player = false;
					row = 0;
					col = 0;
				}
				else
				{	
					std::cout << "Enter row:";
					std::cin >> row;
					std::cout << "Enter col:";
					std::cin >> col;
					continue;
				}
			else
				continue;
		else
			continue;
	}
	board(board_list);
}

char winner_diagonal_1(char board_list[Row_board][Col_board], char symbol)
{
	int for_x = 0;
	int for_o = 0;
	for(int i = 0; i < Row_board; i++)
		for(int j = 0; j < Col_board; j++)
			if(i == j && board_list[i][j] == symbol)
				if(symbol == symbol_x)
				{
					++for_x;
					if(for_x == 3)
					{
						std::cout << "Winner is(pl-1): ";
						return symbol;
					}
				}
				else if(symbol == symbol_o)
				{
					++for_o;
					if(for_o == 3)
					{
						std::cout << "Winner is(pl-2): ";
						return symbol;
					}
				}
				else
					break;
	return 0;
}

char winner_diagonal_2(char board_list[Row_board][Col_board], char symbol)
{
	int for_x = 0;
	int for_o = 0;
	int col_index = 2;
	for(int i = 0; i < Row_board; i++)
		{
			if(board_list[i][col_index] == symbol)
			{
				if(symbol == symbol_x)
				{
					++for_x;
					if(for_x == 3)
					{
						std::cout << "Winner is(pl-1): ";
						return symbol;
					}
				}
				else if(symbol == symbol_o)
				{
					++for_o;
					if(for_o == 3)
					{
						std::cout << "Winner is(pl-2): ";
						return symbol;
					}
				} 
			}
			else 
				break;
			col_index--;
		}
	return 0;
}

char winner_rows(char board_list[Row_board][Col_board], char symbol)
{
	int for_x = 0;
	int for_o = 0;
	for(int i = 0; i < Row_board; i++)
	{
		for(int j = 0; j < Col_board; j++)
		{
			if(board_list[i][j] == symbol)
			{
				if(symbol == symbol_x)
				{
					for_x++;
					if(for_x == 3)
					{
						std::cout << "Winner is(pl-1): ";
						return symbol;
					}
				}
				else if(symbol == symbol_o)
				{
					for_o++;
					if(for_o == 3)
					{
						std::cout << "Winner is(pl-2): ";
						return symbol;
					}
				}
			}
		}
		for_x = 0;
		for_o = 0;
	}
	return 0;
}

char winner_cols(char board_list[Row_board][Col_board], char symbol)
{
	int for_x = 0;
	int for_o = 0;
	for(int i = 0; i < Row_board; i++)
	{
		for(int j = 0; j < Col_board; j++)
		{
			if(board_list[j][i] == symbol)
			{
				if(symbol == symbol_x)
				{
					for_x++;
					if(for_x == 3)
					{
						std::cout << "Winner is(pl-1): ";
						return symbol;
					}
				}
				else if(symbol == symbol_o)
				{
					for_o++;
					if(for_o == 3)
					{
						std::cout << "Winner is(pl-2): ";
						return symbol;
					}
				}
			}
		}
		for_x = 0;
		for_o = 0;
	}
	return 0;
}
