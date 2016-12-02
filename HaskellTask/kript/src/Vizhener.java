/**
 * @Author is flystyle
 * Created on 15.11.16.
 */

import java.util.*;

public class Vizhener {

    public static int findMutation(String start, String end, String[] bank) {
        Set<String> bankSet = new HashSet();
        for (String s: bank) {
            bankSet.add(s);
        }
        Queue<String> queue = new LinkedList();
        Set<String> set = new HashSet();
        char[] genes = {'A', 'C', 'G', 'T'};

        set.add(start);
        queue.offer(start);

        int length = 0;// don't consider the start as one of the steps

        while (!queue.isEmpty()) {
            length++;
            int size = queue.size();
            for ( int j = 0; j < size; j++) {
                String word = queue.poll();
                for (int i = 0; i < word.length(); i++) {
                    for (char c : genes) {
                        StringBuilder sb = new StringBuilder(word);
                        sb.setCharAt(i, c);
                        String temp = sb.toString();

                        if (temp.equals(end) && bankSet.contains(temp)) {
                            return length;
                        }

                        if (bankSet.contains(temp) && !set.contains(temp)) { // avoid duplicated path
                            set.add(temp);
                            queue.offer(temp);
                        }
                    }
                }
            }


        }

        return -1;
    }

    public static String chars[] = {"а","б","в","г","д","е","є","ж","з","и","і","ї","й","к","л","м","н","о","п","р","с","т","у","ф","х","ц","ч","ш","щ","ь","ю","я","_","'",":","."};
    public static String keys[] = {"генерал", "хвиля", "олівець", "коридор", "студент", "стілець", "дерево", "вітер", "дорога", "трамвай", "радість", "небо", "персонал", "книжка"};


    /// ========== INPUT ==========/
//    public static String input = "вторїлйоїеїсоючверпязаьсзмазф'арв.зорзсфазомн_дихоасстенв__меі'тзіч:кьарнрї_вввн_дебл_опр";
//    public static String input = ".х_яж__ч_рсфтзка_щрмйбфаїщоябавсшьцвуоїсрт'ілм:дьотлмєизяш_прс'даюїмртєщк___л.рдх:пьгхрс";
    public static String input = "ктоа_віосьиєятіiцочвiйтiмйєцугйиочрмфок:йчюб:iєфмфщ_.лп:щвєьнгйе'рєгхагш:пмімаі'ячвза:лчхщгібше:щяи";


    public static char convert(char c, char ky) {
        int id = Arrays.asList(chars).indexOf((""+c));
        int shift = Arrays.asList(chars).indexOf((""+ky));
        id = (id - shift + 36) % 36;
        return chars[id].charAt(0);
    }

    public static String convert(String s, String key) {
        String res = "";
        for (int i = 0; i < s.length(); i++) {
            res += convert(s.charAt(i), key.charAt(i));
        }
        return res;
    }

    public static void main(String[] args) {
        String s = input;

        for(String ky : keys) {
            String key = ky;
            while (key.length() < s.length()) key = key + ky;
            String res = convert(s, key);
            System.out.format("%10s \t %s\n", ky, res);
        }
    }
}