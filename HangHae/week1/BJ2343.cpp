#include <bits/stdc++.h>
using namespace std;
int n, m, record[100004], l, r, mid, ans;

int main () {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL); cout.tie(NULL);

    cin >> n >> m;
    for(int i=0; i<n; i++) {
        cin >> record[i];
    }

    l = *max_element(record, record+n);
    r = accumulate(record, record+n, 0);

    while(l <= r) {
        mid = (l+r)/2;
        int cnt = 1, current = mid;

        for(int i=0; i<n; i++) {
            if (record[i]>current) {
                cnt += 1;
                current = mid;
            }
            current -= record[i];
        }

        if (cnt <= m) {
            r = mid - 1;
            ans = mid;
        } else {
            l = mid + 1;
        }
    }

    cout << ans;

    return 0;
}