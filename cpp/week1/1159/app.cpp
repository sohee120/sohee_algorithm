#include <bits/stdc++.h>
using namespace std;

int n;
int alph[30] = {0, };
string str;
string ret;

int main() {

    cin >> n;

    for(int i=0; i<n; i++) {
        cin >> str;
        alph[str[0]-'a']++;
    }

    for(int i=0; i<=25; i++){
        if (alph[i] >= 5) ret += char(i+'a');
    }

    if (ret.size()==0) {cout << "PREDAJA";}
    else cout << ret;

    return 0;
}