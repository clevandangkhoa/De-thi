#include <iostream>
#include <fstream>
using namespace std;

int xx[8] = { 0,0,1,-1 };
int yy[8] = { -1,1,0,0 };
char a[100][100];
bool kt[100][100];
int n, m;
int cao, ga, c, f;

void loang(int x, int y)
{
	kt[x][y] = false;
	if (a[x][y] == 'c')
		c = c + 1;
	if (a[x][y] == 'f')
		f = f + 1;
	for (int i = 0; i <= 3; i++)
	{
		if ((a[x + xx[i]][y + yy[i]] != '#') & (kt[x + xx[i]][y + yy[i]] == true))
			loang(x + xx[i], y + yy[i]);
	}
}

int main()
{
	ifstream FileInput("NONGTRAI.INP");
	ofstream FileOutput("NONGTRAI.OUT");
	FileInput >> m >> n;
	for (int i = 1; i <= m; i++)
		for (int j = 1; j <= n; j++)
		{
			FileInput >> a[i][j];
			kt[i][j] = true;
		}
	for (int i = 1; i <= n; i++)
		for (int j = 1; j <= m; j++)
			if ((a[i][j] != '#') & (kt[i][j] == true))
			{
				c = 0;
				f = 0;
				loang(i, j);
				if (c > f)
					ga = ga + c;
				else cao = cao + f;
			}
	FileOutput << cao << "  " << ga;
	FileInput.close();
	FileOutput.close();
	system("pause");
	return(0);
}