#include <iostream>

using namespace std;

// Recursive function to return gcd of a and b
int hcf(int a, int b) {
    // Everything divides 0
    if (a == 0) return b;
    if (b == 0) return a;
  
    // base case
    if (a == b) return a;
  
    // a is greater
    if (a > b) return hcf(a-b, b);
    return hcf(a, b-a);
}

// Driver program to test above function
int main() {
    int n;
    cin >> n;

    int a[n], b[n];
    
    for (int i=0; i<n; i++) {
        cin >> a[i];
        cin >> b[i];
    }

    for (int i=0; i<n; i++) {
        cout << hcf(a[i],b[i]);
        cout << endl;
    }

    return 0;
}