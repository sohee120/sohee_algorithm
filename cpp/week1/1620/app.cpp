#include <bits/stdc++.h>
using namespace std;

int n, m ;
string s ;
map<string, int> _map; //
map<int, string> _map2;

int main() {

    cin >> n >> m ;

    for(int i=0; i<n; i++) {
        cin >> s;
        _map[s] = i+1;
        _map2[i+1] = s; 
    }

    for(int i=0; i<m; i++) {
        cin >> s; 
		if(atoi(s.c_str()) == 0){
			cout << _map[s] << "\n";
		}else{
			cout << _map2[atoi(s.c_str())] << "\n"; 
		}
    }

    return 0;
}