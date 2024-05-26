#include<iostream>
#include<math.h>
using namespace std;

int ifprime(long int);
long int temp,checkprime,p,q;

// to find the gcd of two numbers 
int gcd(int num1 , int num2) {
    
    if (num1 == num2)
        return num1 ;
    
    if (num1 > num2)
        return gcd(num1-num2, num2);
    return gcd(num1, num2-num1);
   
   }


int ifprime(long int prime)
{
    int i;
    temp = sqrt(prime);
    for (i = 2; i <= temp; i++)
    {
        if (prime % i == 0)
            return 0;
    }
    return 1;
}

int main() {
   
   cout << "enter your first prime number:";
    cin >> p;
    checkprime = ifprime(p);
    if (checkprime == 0)
    {
        cout << "\nthe entered number is not a prime please enter another prime number\n";
        exit(1);
    }
    cout << "\nenter your second prime number:";
    cin >> q;
    checkprime = ifprime(q);
    if (checkprime == 0 || p == q)
    {
        cout << "\n The number you entered is either not a prime number or it is the same prime number as the first enter a different prime number\n";
        exit(1);
    }
   double n=p*q;
   double checkgcd;
   double phi= (p-1)*(q-1);
   //public key
  
   double e=7;// let us have e= 7 
   //next check that 1 < e < phi and if e and phi are coprime.
   while(e<phi) {
      checkgcd = gcd(e,phi);
      if(checkgcd==1)
         break;
      else
         e++;
   }
   cout << "\nthe public key is "<<e;
   cout<<",";
   cout<<n ;
   // selecting a private key d
   
   double tempd =1/e;
   double d=fmod(tempd,phi);
   cout << "\nthe private key is "<<d;
   cout<<",";
   cout<<n;
   
   cout << "\nenter the number to encrypt:";
   double number_to_encrypt ;
   cin >> number_to_encrypt ;
   double encrpyted_message= pow(number_to_encrypt,e); //encrpytion
   double decrpyted_message = pow(encrpyted_message,d);//decrpytion
   encrpyted_message=fmod(encrpyted_message,n);
   decrpyted_message=fmod(decrpyted_message,n);
   

   cout<<"\n"<<" The encrypted number is = "<<encrpyted_message;
   cout<<"\n"<<"The decrpyted message is = "<<decrpyted_message;
   return 0;
   
}
