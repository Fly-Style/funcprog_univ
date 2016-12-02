/**
 * @Author is flystyle
 * Created on 18.10.16.
 */

/**
 * @Author is flystyle
 * Created on 13.08.16.
 */

//* Definition for singly-linked list.

public class CesarCipher {
    public static void main(String[] args) {
        String s = "абвгдеєжзиiїйклмнопрстуфхцчшщьюя_.!,-()':;\"";
        String ss = ";:\"вж'_-.цйьйбф'.й\"фш.:фаб:б";

        for (int i = 0; i < 42; ++i) {
            String tmp = "";
            for (int j = 0; j < ss.length(); j++) {
                int id = s.indexOf(ss.charAt(j));
                id -= i;
                if (id < 0) id += 43;
                tmp += s.charAt(id);
            }
            System.out.println(i + ": " + tmp);
        }
    }
}

