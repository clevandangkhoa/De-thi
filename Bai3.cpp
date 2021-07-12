#include <iostream>
#include <fstream>
using namespace std;

int xx[4] = { 0,0,1,-1 };
int yy[4] = { -1,1,0,0 };

int a[7][7],b[7][7];
bool kt[7][7];
bool p[7][7];
int n, m;
int minn = 1000;
int maxn = -1000;
int dem;
bool check;

void loang2(int x, int y)
{
	p[x][y] = false;
	if ((b[x][y] == 0) && ((x == 0) || (y == 0) || (x == n) || (y == m)))
		check = false;
	for (int i = 0; i <= 3; i++)
	{
		if (p[x + xx[i]][y + yy[i]] == true)
		{
			loang2(x + xx[i], y + yy[i]);
		}
	}
}
void loang(int x, int y)
{
	kt[x][y] = false;
	for (int i = 0; i <= 3; i++)
	{
		if (kt[x + xx[i]][y + yy[i]] == true)
		{
			if (b[x+xx[i]][y+yy[i]] != 0)
				loang(x + xx[i], y + yy[i]);
			else
			{
				check = true;
				for (int ii = 1; ii <= n; ii++)
					for (int jj = 1; jj <= m; jj++)
						p[ii][jj] = true;
				loang2(x + xx[i], y + yy[i]);
				if (check == true)
				{
					loang(x + xx[i], y + yy[i]);
				}
			}
		}
	}
}

int main()
{
	ifstream FileInput("NUOCBIEN.INP");
	ofstream FileOutput("NUOCBIEN.OUT");
	FileInput >> n >> m;
	for (int i = 1; i <= n; i++)
		for (int j = 1; j <= m; j++)
		{
			FileInput >> a[i][j];
			if (a[i][j] > maxn)
				maxn = a[i][j];
			if (a[i][j] < minn)
				minn = a[i][j];
		}
	FileInput.close();
	for (int k = 1; k <= maxn; k++)
	{
		for (int i = 1; i <= n; i++)
			for (int j = 1; j <= m; j++)
			{
				kt[i][j] = true;
				if (k <= a[i][j])
					b[i][j] = a[i][j] - k;
				else b[i][j] = 0;
			}
		dem = 0;
		for (int i = 1; i <= n; i++)
			for (int j = 1; j <= m; j++)
				if ((b[i][j] != 0) && (kt[i][j] == true))
				{
					loang(i, j);
					dem = dem + 1;
				}
		if (dem > 1)
		{
			FileOutput << "Dao bi chia khi nuoc bien dang cao " << k << " feet";
			FileOutput.close();
			system("pause");
			return(0);
		}
	}
	FileOutput << "Dao khong bao gio bi chia cat";
	FileOutput.close();
	system("pause");
	return(0);
}