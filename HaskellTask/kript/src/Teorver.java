
public class Teorver {

    public static void main(String[] args) {
        StringBuilder builder = new StringBuilder("ABCDEF");
        builder.deleteCharAt(0);
        builder.deleteCharAt(2);
        System.out.println(builder.toString());
    }

}