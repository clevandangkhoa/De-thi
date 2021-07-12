#include <iostream>
#include <fstream>
using namespace std;

int xx[4] = { 0,0,1,-1 };
int yy[4] = { -1,1,0,0 };


char a[101][101];
bool kt[101][101];
int r, c;
int maxn;
int Bx, By, Cx, Cy;

void loang(int x, int y, int dem)
{
	kt[x][y] = false;
	for (int i = 0; i <= 3; i++)
	{
		if ((kt[x + xx[i]][y + yy[i]] == true) && (a[x + xx[i]][y + yy[i]] != '*'))
		{
			kt[x + xx[i]][y + yy[i]] = false;
			if (a[x + xx[i]][y + yy[i]] == 'C')
			{
				if (dem > maxn)
					maxn = dem;
			}
			else loang(x + xx[i], y + yy[i], dem + 1);
		}
	}
}

int main()
{
	ifstream FileInput("GAMCO.INP");
	ofstream FileOutput("GAMCO.OUT");
	FileInput >> r >> c;
	for (int i = 1; i <= r; i++)
		for (int j = 1; j <= c; j++)
		{
			FileInput >> a[i][j];
			if (a[i][j] == 'B')
			{
				Bx = i;
				By = j;
			}
			if (a[i][j] == 'C')
			{
				Cx = i;
				Cy = j;
			}
			kt[i][j] = true;
		}
	maxn = 0;
	loang(Bx, By, 1);
	FileOutput << maxn;
	FileInput.close();
	FileOutput.close();
	system("pause");
	return(0);
}