

int main(){
    char al;
    char bl;

    al = 0xFE; // 254 => -2
    bl = -1;

    al = bl + al; // 253 => -3
    bl++; // bl == 0

    return al;
}