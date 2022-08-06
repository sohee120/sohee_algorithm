#include <bits/stdc++.h>
using namespace std;

string str1;
string str2;

int main() {

    cin >> str1;
    str2 = str1;
    reverse(str1.begin(), str1.end());

    if (str1 == str2) cout << 1;
    else cout << 0;

    return 0;
    
}