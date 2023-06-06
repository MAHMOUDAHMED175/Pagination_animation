
import 'dart:io';

void main1() {
  GCD();
  for(int mahmoud=0;mahmoud<1000;mahmoud++){
    print('عايز تكتب تانى؟؟؟؟choice between yes and no');
    String action=stdin.readLineSync()!;
    if (action=='yes'||action=='YES'||action=='Y'||action=='y'||action=='Yes') {
      GCD();
    } else {
      break;
    }
  }
}
String? too;

void GCD() {
  int? gcd;
  do{
    print('enter the number of A\n');
    int A=int.parse(stdin.readLineSync()!);
    print('enter the number of B');
    int B=int.parse(stdin.readLineSync()!);
    if ( B == 0||A==0) {
      print('مينفعش تكتب الصفر لو عايز تجرب تانى اختار مابين yes or no ');
      too=stdin.readLineSync()!;
    } else {
      if (A<B) {
        gcd =B % A ;
      } else {
        gcd =A % B ;
      }
      print('your numbers are $A  and  $B');
      print('the GCD is $gcd');
    }
  }while(too=='yes'||too=='YES'||too=='Y'||too=='y'||too=='Yes');

}