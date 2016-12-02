/**
 * @Author is flystyle
 * Created on 20.11.16.
 */
import java.util.*;

public class Sol2 {

//    public class Solution1 {
//        private String input;
//        private String res;
//        private String settings;
//        private String simplifier;
//        private List<String> tree = new ArrayList<>();
//
//        public String getRes() {
//            return res;
//        }
//
//        public Solution1(String input) {
//            this.input = input.replaceAll(" ", "");
//            parseInput();
//        }
//
//        public String reverse(String str){
//            String res = "";
//            for (int i = str.length() - 1; i >= 0; --i) {
//                if (str.charAt(i) == '(')
//                    res += ")";
//                else if (str.charAt(i) == ')')
//                    res += "(";
//                else res += str.charAt(i);
//            }
//            return res;
//        }
//
//        public String cutter (String str, final int layer) {
//            StringBuilder sb = new StringBuilder(str);
//            String out = "";
//            int bracketLayer = layer;
//            int first = 0, second = 0;
//            for (int i = 0; i < sb.length(); ++i) {
//                if (sb.charAt(0) == '(') {
//                    bracketLayer++;
//                    for (int j = 0; j < sb.length(); ++j) {
//                        if (sb.charAt(j) == ')') {
//                            --bracketLayer;
//                            if (bracketLayer == layer) {
//                                sb.deleteCharAt(0);
//                                sb.deleteCharAt(j - 1);
//                                String temp = sb.substring(0, j - 1);
//                                System.out.println("==> " + temp);
//                                if (!temp.contains(temp))
//                                    out += temp;
//                                break;
//                            }
//
//                        }
//                    }
//
//                }
//                else {
//                    if (sb.charAt(i) == '(') {
//                        ++bracketLayer;
//
//                        if (bracketLayer == layer + 1) {
//                            first = i + 1;
//                        }
//                    }
//                    else if (sb.charAt(i) == ')') {
//                        --bracketLayer;
//                        if (bracketLayer == layer) {
//                            second = i;
//                            String checking = sb.substring(first, second);
//                            System.out.println("--> " + checking);
//                            if (checking.length() > 0) {
//                                String temp = cutter(sb.substring(first, second), layer + 1);
//                                if (!out.contains(temp)) {
//                                    out += "(";
//                                    out += cutter(sb.substring(first, second), layer + 1);
//                                    out += ")";
//                                }
//                            }
//                        }
//                    } else {
//                        if (bracketLayer == layer)
//                            if (!out.contains("" + sb.charAt(i)))
//                                out += sb.charAt(i);
//                    }
//                }
//            }
//            return out;
//        }
//
//        public String simplify(String str) {
//            return cutter(str, 0);
//        }
//
//        private void parseInput() {
//            String str = this.input;
//            int settings_ = str.indexOf("/");
//            this.input = str.substring(0, settings_);
//            if (input.length() == 0) {
//                this.settings = "";
//                return;
//            }
//            this.settings = str.substring(++settings_);
//
//
//        }
//
//        public void processing() {
//            Deque<String> queue = new ArrayDeque<>();
//            boolean wasS = false;
//            for (int i = 0; i < settings.length(); ++i) {
//                if (!wasS)
//                    if (settings.charAt(i) == 'S') {
//                        queue.offer("S");
//                        wasS = true;
//                    }
//                if (settings.charAt(i) == 'R')
//                    queue.add("R");
//
//            }
//            String tempo = this.input;
//            while (!queue.isEmpty()) {
//                String action = queue.poll();
//                if (action.equals("S"))
//                    tempo = simplify(tempo);
//                else tempo = reverse(tempo);
//            }
//            this.res = tempo;
//
//        }
//
//        // AB((C)DE((FG)H(I))J) / S -> AB(CDE(FGH(I))J)
//        // (J((I)H(GF))ED(C))BA /S -> J(IH(GFED(C))BA
//        // (AB)C /RS -> C(BA)
//        // A(BC) /RS -> CBA
//
////        public static void main(String[] args) {
////
////            Scanner scanner = new Scanner(System.in);
////            while (scanner.hasNext()) {
////                String input = scanner.nextLine();
////                Solution solution = new Solution(input);
////                solution.processing();
////                System.out.println(solution.getRes());
////            }
////        }
//    }
    private String input;
    private String res;
    private String settings;
    private Tree tree_ = new Tree();
    private List<String> tree = new ArrayList<>();

    private class Node {
        public String value;
        public List<Node> sons;

        public Node(String value) {
            this.value = value;
            this.sons = new ArrayList<>();
        }
    }

    private class Tree {
        public Node root;
        public String cutted = "";

        public Tree() {
            this.root = new Node("");
        }

        public void buildTree(Node node, String str) {

            if (!str.contains(")") || !str.contains("(")) {
                for (int i = 0; i < str.length(); ++i)
                    node.sons.add(new Node("" + str.charAt(i)));
                return;
            }


            int bracketLayer = 0;
            boolean wasCutted = false;
            int leftBound = 0, rightBound = 0;
            StringBuilder sb = new StringBuilder(str);
            for (int i = 0; i < sb.length(); ++i) {
                if (sb.charAt(i) == '(') {
                    ++bracketLayer;
                    if (bracketLayer == 1) {
                        leftBound = i+1;
                    }
                }

                else if (sb.charAt(i) == ')') {
                    --bracketLayer;
                    if (bracketLayer == 0) {
                        rightBound = i;
                        node.sons.add(new Node(str.substring(leftBound, rightBound)));
                        wasCutted = true;
                    }
                }
                else {
                    if (bracketLayer == 0)
                        node.sons.add(new Node("" + sb.charAt(i)));
                }
            }

            for (Node son : node.sons) {
                buildTree(son, son.value);
            }

        }

        public void cutter(Node node) {
            for (int i = 0; i < node.sons.size(); ++i) {
                if (node.sons.get(i).value.contains("(")) {
                    StringBuilder _str = new StringBuilder(node.sons.get(i).value);
                    int indx = _str.indexOf("(");
                    int indl = _str.indexOf(")");
                    _str.deleteCharAt(indx);
                    _str.deleteCharAt(indl-1);
                    node.sons.get(i).value = _str.toString();
                }
                if (node.sons.get(i).value.length() > 1)
                    cutter(node.sons.get(i));
            }
        }

        public void printTree(Node node) {
            for (int i = 0; i < node.sons.size(); ++i) {
                if (!node.sons.get(i).value.contains("(") ||  !node.sons.get(i).value.contains(")"))
                    cutted += node.sons.get(i).value;

                if (node.sons.get(i).sons.size() > 0) {
                    cutted += "(";
                    printTree(node.sons.get(i));
                    cutted += ")";
                }
            }
        }
    }

    public String getRes() {
        return res;
    }

    public Sol2(String input) {
        this.input = input.replaceAll(" ", "");
        this.res = "";
        parseInput();
    }

    public void findUnboundedSymbol(String string) {
        String str = "";
        int bracketCounter = 0;
        Deque<Integer> stack = new ArrayDeque<>();

        for (int i = 0; i < string.length(); ++i) {

            if(string.charAt(i) == '(' && str.length() > 0 && bracketCounter == 0)
                tree.add(str);

            // if we see open bracket, push in to stack , and wait close bracket for this
            if (string.charAt(i) == '(') {
                ++bracketCounter;
                stack.push(i+1);
            }

            if (string.charAt(i) == ')') {
                --bracketCounter;
                int bound = stack.pop();
                findUnboundedSymbol(string.substring(bound, i));
            }

            else if (bracketCounter == 0)
                str += string.charAt(i);
        }
        if (!tree.contains(str))
            tree.add(str);

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

    public String simplify(String str) {
        tree_.buildTree(tree_.root, str);
        tree_.cutter(tree_.root);
        tree_.printTree(tree_.root);
        return tree_.cutted;
    }

    private void parseInput() {
        if(input.equals(""))
            return;
        String str = this.input;
        int settings_ = str.indexOf("/");
        this.input = str.substring(0, settings_);
        this.settings = str.substring(++settings_);
    }

    public void processing() {
        Deque<String> queue = new ArrayDeque<>();
        boolean wasS = false;
        for (int i = 0; i < settings.length(); ++i) {
            if (!wasS) {
                if (settings.charAt(i) == 'S') {
                    queue.offer("S");
                    wasS = true;
                }
            }
            if (settings.charAt(i) == 'R')
                queue.add("R");

        }
        String temp = this.input;
        while (!queue.isEmpty()) {
            String action = queue.poll();
            if (action.equals("S")) {
                temp = simplify(temp);
            }
            else temp = reverse(temp);
        }
        this.res = temp;

    }

    // AB((C)DE((FG)H(I))J) / S -> AB(CDE(FGH(I))J)

    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        while (scanner.hasNext()) {
            String input = scanner.nextLine();
            Sol2 solution = new Sol2(input);
            solution.processing();
            System.out.println(solution.getRes());
        }
    }
}