// int wrapper() {
//     signed char a=1, b=017, c=-1, d=0xf0;
//     int xd = (a<<7)+(b^0)+(c&d);
//     return xd;
// }

int main(){
    signed char a=1, b=017, c=-1, d=0xf0;
    char xd = (b^0)+(c&d);
    char xd1 = (a<<7);
    int xd2 = xd1+xd;
    return xd;
}

// 11111111
// 1111111