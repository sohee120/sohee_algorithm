#include <bits/stdc++.h>
using namespace std;
int a, n ;
string s1, s2, pref, suff;

int main() {

    cin >> n;
    cin >> s1;

    a = s1.find("*");
    pref = s1.substr(0, a);
    suff = s1.substr(a+1);

    for (int i=0; i<n; i++) {
        cin >> s2;

        if (pref.size()+suff.size() > s2.size()) {
            cout << "NE\n";
        }else{
            if(pref == s2.substr(0, pref.size()) && suff == s2.substr(s2.size()-suff.size())) {
                cout << "DA\n";
            }else{
                cout << "NE\n";
            }
        }
    }
return 0;
}

