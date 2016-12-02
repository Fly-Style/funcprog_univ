import java.util.ArrayList;

public class Main {
    static public ArrayList<Long> steps (int num) {
        ArrayList<Long> res = new ArrayList<Long>();
        for (long i = 1; i <= Integer.MAX_VALUE; i*=2) {
            if ((i&num) != 0)
                res.add(i);
        }
      // System.out.println(res);
        return res;
    }
    static public long binStep (int A, int b, int mod){
        if (b == 1) return A % mod ;
        long res1 = binStep(A, b/2, mod);
        if (b%2 == 1)
            return ((res1*res1)%mod*A)%mod;
        else
            return (res1*res1)%mod;
    }
    static public long getRes(int A, int mod, ArrayList<Long> steps){
        int res = 1;
        int temp = A;
        int out = A;
        int temptemp = 0;
           int temptemp1 = 0;
        for (long i = 1; i <= steps.get(steps.size()-1) ; i*=2) {

            if (steps.contains(i)){
                res*= temp;
                res%=mod;
            }

            if (i!=1 && temp == out)
            System.out.println(A +"^" + i + " = " + A + "^"+ i/2 + "*" +  A +  "^"+ i/2+  " = " +  temp + " % " + mod );
            else if (i == 1)
                System.out.println(A +"^" + i + " = " +  temp + " % " + mod);
            else
                System.out.println(A +"^" + i + " = " + A + "^"+ i/2 + "*" +  A +  "^"+ i/2+  " = " + temptemp1 + " * "+ temptemp1  + " = " + temp + " % " + mod );
            out*=out;
            temp *= temp;
            temp%=mod;
            temptemp1 = temptemp;
            if (out!=temp)temptemp =  temp;

        }
        return res;
    }
    static void twoKeys (int a, int b, int g, int p){
        long A =0 , B = 0, temp;
        ArrayList<Integer> resultsX = new ArrayList<Integer>();
        ArrayList<Integer> resultsY = new ArrayList<Integer>();
        for (int i = 1; i < p ; i++) {
            temp = binStep(g, i, p);
            if (i == a) A = temp;
            if (i == b) B = temp;
        }
        for (int i = 1; i < p ; i++) {
            temp = binStep(g, i, p);
           System.out.print(i + " " + temp + " " + temp);
            if (temp == A) System.out.println("!!!!!");
            else
            if (temp == B) System.out.println("!!!!!");
            else System.out.println();
            if (A == temp) resultsX.add(i);
            if (B == temp) resultsY.add(i);
        }
        System.out.println(resultsX);
        System.out.println(resultsY);
        System.out.println("--------------");
        for (int i = 0; i < resultsX.size(); i++) {
            for (int j = 0; j < resultsY.size(); j++) {
                System.out.println(resultsX.get(i) + " " + resultsY.get(j) + " " + resultsX.get(i)* resultsY.get(j)  + " " + binStep(g, resultsX.get(i)* resultsY.get(j) , p) + " " +resultsX.get(i)* resultsY.get(j) %(p-1) );
            }
        }
//        System.out.println(A + " " + B);
//        System.out.println(resultsX);
//        System.out.println(resultsY);

    }


    public static void main(String[] args) {
//        int a = 36;
//        int b = 38;
//        int p = 53;
//        int g = 4;
//        System.out.println(getRes(g, p, steps(a * b)));
//        System.out.println(binStep(g, a*b, p));
//
//
//
        // second
        int i = 1;
        while (true) {
            // A, g, p
            if (521 == getRes(3, 12413, steps(i) )){
                System.out.println(i);
                break;
            }
            i++;
        }

        // a, b, g, mod - third
        //twoKeys(22, 27, 7, 31);
    }
}
