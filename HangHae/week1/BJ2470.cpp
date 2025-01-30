#include <bits/stdc++.h>
using namespace std;
typedef long long ll;
int liquid[100004], n, val = INFINITY, ans[2];

int main() {
    
    cin >> n;

    for(int i=0; i<n; i++) {
        cin >> liquid[i];
    }

    sort(liquid, liquid+n);

    int start = 0, end = n-1;

    while(start < end) {
        int sum = liquid[start] + liquid[end];

        if (abs(sum) < val) {
            val = abs(sum);
            ans[0] = liquid[start];
            ans[1] = liquid[end];
            if (sum == 0) break;
        }

        if (sum < 0) start ++;
        else end -- ;
       
    }

    cout << ans[0] << ' ' << ans[1];

    return 0;
}