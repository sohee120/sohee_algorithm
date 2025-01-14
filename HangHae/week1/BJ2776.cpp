#include <bits/stdc++.h>
using namespace std;
typedef long long ll;
int t, n, m, temp;
vector<int> v;

int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL); cout.tie(NULL);

    cin >> t;

    for(int i=0; i<t; i++) {
        v.clear();
        cin >> n;

        for(int i = 0; i<n; i++) {
            cin >> temp;
            v.push_back(temp);
        }

        sort(v.begin(), v.end());

        cin >> m;

        for(int i = 0; i<m; i++) {
            cin >> temp;

            auto upper = upper_bound(v.begin(), v.end(), temp);
            auto lower = lower_bound(v.begin(), v.end(), temp);

            if(upper-lower > 0) cout << 1 << '\n';
            else cout << 0 << '\n';

        }
    }
    return 0;
}