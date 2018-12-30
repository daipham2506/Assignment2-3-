#include <stdio.h>
#include <conio.h>

void main()
{
	char a[1000], b[1000] = "";
	printf("Nhap chuoi: ");
	fgets(a, 1000, stdin);
	for (int i = 0; a[i] != '\0'; i++) {
		if (a[i] <= 'Z' && a[i] >= 'A') b[i] = a[i] + 32;
		else if (a[i] <= 'z' && a[i] >= 'a') b[i] = a[i] - 32;
		else b[i] = a[i];
	}
	printf("Chuoi sau khi da chuyen la: %s", b);
	_getch();
}