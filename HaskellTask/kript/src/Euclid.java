import java.math.BigInteger;

/**
 * @Author is flystyle
 * Created on 04.10.16.
 */
public class Euclid {
    // Recursive implementation
    static BigInteger gcd(BigInteger p, BigInteger q) {
        if (q.equals(BigInteger.ZERO)) {
            return p;
        }
        else {
            BigInteger a = q.multiply(p.divide(q));
            BigInteger b = p.subtract(a);
            System.out.printf("%s = %s * %s + %s\n", p, q, p.divide(q), b);
            return gcd(q, p.mod(q));
        }

    }

    // p - q * (p / q)

    public static void main(String[] args) {
        gcd(new BigInteger("3717342181587109"), new BigInteger("1112522638654146"));
    }
}