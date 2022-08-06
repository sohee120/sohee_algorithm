#include<bits/stdc++.h>
using namespace std;

int cnt[40] = {0, };
string s;


int main() {
    cin >> s;
    for (int i=0; i<s.size(); i++) {
        int idx = int(s[i])-97;
        cnt[idx] += 1;
    }

    for (int i=0; i<26; i++){
        cout << cnt[i] << " ";
    }
    return 0;
}