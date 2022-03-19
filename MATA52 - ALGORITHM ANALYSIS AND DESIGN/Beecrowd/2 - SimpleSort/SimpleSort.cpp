#include <iostream>
 
using namespace std;

void swap(int *a, int *b){ 
    float temp = *a; 
    *a = *b; 
    *b = temp; 
}

void bubbleSort(int arr[], int n) {
    int i, j;
    for (i=0; i<n-1; i++) {
        for (j=0; j<n-i-1; j++) {
            if (arr[j]>arr[j+1]) {
                swap(&arr[j], &arr[j+1]);
            }
        }
    }
}

int main() {
    int a[3], b[3];
    for (int i=0; i<3; i++) {
        cin >> a[i];
        b[i] = a[i];
    }
    
    bubbleSort(b,3);
 
    for (int i=0; i<3; i++) cout << b[i] << endl;
    cout << endl;
    for (int i=0; i<3; i++) cout << a[i] << endl;
 
    return 0;
}