#include <bits/stdc++.h>
using namespace std;

int main() {
vector<int> v(5, 0);
for(int i = 1; i <= 5; i++) v.push_back(i*100);

for (int i = 0; i<v.size(); i++) cout << v[i] << " " ;
cout << "\n";

fill(v.begin(), v.end(), -2);
for (int i = 0; i<v.size(); i++) cout << v[i] << " " ;

return 0;
}