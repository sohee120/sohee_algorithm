#include<bits/stdc++.h>
using namespace std;

int n, idx;
string ori_s, s, pref, suff;

int main() {
    cin >> n;
    cin >> ori_s;

    idx = ori_s.find("*");
    pref = ori_s.substr(0, idx);
    suff = ori_s.substr(idx+1);

    for(int i=0; i<n; i++) {
        cin >> s;

        if(pref.size()+suff.size() >s.size()) {
            cout << "NE\n";
        }else{
            if(pref == s.substr(0, pref.size()) && suff == s.substr(s.size()-suff.size())) {
                cout << "DA\n";
            }else{
                cout << "NE\n";
            }
        }
    }

    return 0;
}
