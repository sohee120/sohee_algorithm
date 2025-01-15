# include <bits/stdc++.h>
using namespace std;
typedef long long ll;
ll ans;
ll n, k;
ll cables[10000];

int main () {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL); cout.tie(NULL);

    cin >> k >> n;

    ll maxLength = 0;
    for (int i=0; i<k; i++) {
        cin >> cables[i];
        maxLength = max(maxLength, cables[i]);
    }

    ll left = 1, right = maxLength, mid;

    while (left <= right) {
        mid = (left + right)/2;
        ll sum = 0;
        for(int i = 0; i<k; i++) {
            sum += cables[i]/mid; 
        }
        if (sum >= n) {
            left = mid + 1;
            ans = max(ans, mid);
        } else {
            right = mid - 1;
        }
    }

    cout << ans << '\n';


    return 0;
}