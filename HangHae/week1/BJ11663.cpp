#include <bits/stdc++.h>
using namespace std;
typedef long long ll;
int n, m, temp, point[100000];

int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL); cout.tie(NULL);

    cin >> n >> m;

    for(int i = 0; i<n; i++) {
        cin >> point[i];
    }

    sort(point, point + n);

    for(int i=0; i<m; i++) {
        int j, k;
        cin >> j >> k;
        cout << upper_bound(point, point+n, k) - lower_bound(point, point + n, j) << '\n';
    }

    return 0;
}