#include <bits/stdc++.h>
using namespace std;

int cnt[101] = {0, };
int a, b, c;
int n, m;
int sum = 0;

int main() {

    cin >> a >> b >> c;

    for (int i=0; i<3; i++) {
        cin >> n >> m;
        for (int j = n; j<m; j++){
            cnt[j]++;
        }
    }

    
    for (int i = 0; i<=100; i++) {
        if (cnt[i] == 1) sum += a;
        else if (cnt[i] == 2) sum += 2*b;
        else if (cnt[i] == 3) sum += 3*c;
    }

    cout << sum ;

    return 0;
}