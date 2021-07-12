#include <iostream>
#include <fstream>
using namespace std;

int xx[8] = { 0,0,1,1,1,-1,-1,-1 };
int yy[8] = { -1,1,-1,0,1,-1,0,1 };
char a[100][100];
bool kt[100][100];
int n, m;
int dem;

void loang(int x, int y)
{
	kt[x][y] = false;
	for (int i = 0; i <= 7; i++)
	{
		if ((a[x + xx[i]][y + yy[i]] == 'W') & (kt[x + xx[i]][y + yy[i]] == true))
			loang(x + xx[i], y + yy[i]);
	}
}

int main()
{
	ifstream FileInput("OLP.INP");
	ofstream FileOutput("OLP.OUT");
	FileInput >> n >> m;
	for (int i = 1; i <= n; i++)
		for (int j = 1; j <= m; j++)
		{
			FileInput >> a[i][j];
			kt[i][j] = true;
		}
	for (int i = 1; i <= n; i++)
		for (int j = 1; j <= m; j++)
			if ((a[i][j] == 'W') & (kt[i][j] == true))
			{
				dem = dem + 1;
				loang(i, j);
			}
	FileOutput << dem;
	FileInput.close();
	FileOutput.close();
	system("pause");
	return(0);
}