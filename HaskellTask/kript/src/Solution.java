import java.util.*;

public class Solution {
    private String input;
    private String res;
    private String settings;
    private String simplifier;
    private List<String> tree = new ArrayList<>();

    public String getRes() {
        return res;
    }

    public Solution(String input) {
        this.input = input.replaceAll(" ", "");
        parseInput();
    }

    public String reverse(String str){
        String res = "";
        for (int i = str.length() - 1; i >= 0; --i) {
            if (str.charAt(i) == '(')
                res += ")";
            else if (str.charAt(i) == ')')
                res += "(";
            else res += str.charAt(i);
        }
        return res;
    }

    public String simplify(String s) {
        if (s.length() == 0) return "";
        String result = "";
        int i = 0;
        if (s.charAt(0) == '(') { // need to delete
            int bracketLayer = 1;
            i = 1;
            String tmp = "";
            while (bracketLayer > 0) {
                if (s.charAt(i) == '(')
                    bracketLayer++;
                else if (s.charAt(i) == ')') bracketLayer--;
                i++;
            }
            result += simplify(s.substring(1, i-1));
        }
        while (i < s.length()) {
            if (s.charAt(i) == '(') {
                int end = i+1, bracketLayer = 1;
                while (bracketLayer > 0) {
                    if (s.charAt(end) == '(') bracketLayer++;
                    else if (s.charAt(end) == ')') bracketLayer--;
                    end++;
                }
                // "( [i+1 .. end-2] )"
                result += "(" + simplify(s.substring(i+1, end-1)) + ")";
                i = end-1;
            } else {
                result += s.charAt(i);
            }
            i++;
        }
        return result;
    }

    private void parseInput() {
        String str = this.input;
        int settings_ = str.indexOf("/");
        this.input = str.substring(0, settings_);
        if (input.length() == 0) {
            this.settings = "";
            return;
        }
        this.settings = str.substring(++settings_);
    }

    public void processing() {
        Deque<String> queue = new ArrayDeque<>();
        boolean wasS = false;
        for (int i = 0; i < settings.length(); ++i) {
            if (!wasS && settings.charAt(i) == 'S') {
                queue.offerLast("S");
                wasS = true;
            }

            if (settings.charAt(i) == 'R') {
                queue.offerLast("R");
                wasS = false;
            }
        }

        String tempo = this.input;
        while (!queue.isEmpty()) {
            String action = queue.pollFirst();
            if (action.equals("S"))
                tempo = simplify(tempo);
            else tempo = reverse(tempo);
        }
        this.res = tempo;

    }

    // AB((C)DE((FG)H(I))J) / S -> AB(CDE(FGH(I))J)
    // (J((I)H(GF))ED(C))BA /S -> J(IH(GFED(C))BA
    // (AB)C /RS -> C(BA)
    // A(BC) /RS -> CBA

    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        while (scanner.hasNextLine()) {
            String input = scanner.nextLine();
            Solution solution = new Solution(input);
            solution.processing();
            System.out.println(solution.getRes());
        }
    }
}