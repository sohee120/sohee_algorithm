#include <bits/stdc++.h>
using namespace std;
typedef pair<int,int> pp;
bool cmp (pair<int,int> a, pair<int,int> b){
    return a.second<b.second;
}

int main() {
    pair<int, int> p;
    vector<pair<int, int>> v;
    v.push_back({1,5});
    v.push_back({2,4});
    sort(v.begin(), v.end(), cmp);
    for(pp it: v) cout << it.first <<" " <<it.second <<"\n";
}