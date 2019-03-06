#include <cstdio>
#include <vector>
#include <iostream>
#include <map>
//#include <fstream>
//#include <sstream>
//#include <stdexcept>
using namespace std;
int main (void)
{
    vector<int> v;
    v.push_back(12);
    v.push_back(12);
    v.push_back(12);
    v.push_back(12);
    v.push_back(12);
    v.push_back(12);
    v.push_back(12);
    v.push_back(12);
    v.push_back(12);
    v.push_back(15);
    v.push_back(12);
    v.push_back(13);
    v.push_back(13);
    v.push_back(13);
    map<int, char> m = new map<int, char>(10);
    //cout<<v.empty()<<v.size()<<v.capacity();
    cout<<v[0]<<endl<<v[9]<<endl<<v[10]<<endl<<v[11];
    v.clear();
    puts("Check");
    return 1;
}
