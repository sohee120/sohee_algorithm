#include <bits/stdc++.h>
using namespace std;

int n;
int idx;
string s, pref, suff;
string fl;


int main() {

    cin >> n;
    cin >> s;

    idx = s.find("*");

    pref = s.substr(0, idx);
    suff = s.substr(idx+1);

    
    for(int i=0; i<n; i++) {

        cin >> fl;

        if (pref.size()+suff.size() > fl.size()) {
            cout << "NE\n";
        }else{
            if((pref == fl.substr(0, pref.size())) && suff == fl.substr(fl.size()-suff.size())) {
                cout << "DA\n";
            }else{
                cout << "NE\n";
            }
        }
}

return 0;

}