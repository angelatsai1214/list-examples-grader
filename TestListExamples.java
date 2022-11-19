import static org.junit.Assert.assertArrayEquals;
import java.util.ArrayList;
import java.util.List;
import org.junit.Test;

public class TestListExamples {

    @Test
    public void testFilter() {
        List<String> li = new ArrayList<>();     
        li.add("pple");

        StringChecker sc = new StringChecker(){
                public boolean checkString(String s) {
                        for (int i = 0; i < s.length(); i++) {
                                if (s.charAt(i) == 'a' || s.charAt(i) == 'A')
                                       return true;
                        }
                        return false;
                         }
        };

        List<String> liAfterFilter = ListExamples.filter(li, sc);



        assertArrayEquals(new String[] {}, liAfterFilter.toArray());
    }

    @Test
    public void testMerge() {
        List<String> li1 = new ArrayList<>();
        li1.add("a");
        li1.add("c");
        li1.add("e");

        List<String> li2 = new ArrayList<>();
        li2.add("b");
        li2.add("d");
        li2.add("g");
        String[] ans = { "a", "b", "c", "d", "e", "g" };
        List<String> merged = ListExamples.merge(li1, li2);

        assertArrayEquals(ans, merged.toArray());

    }
        List<String> liAfterFilter = ListExamples.filter(li, sc);



        assertArrayEquals(new String[] {}, liAfterFilter.toArray());
    }

}
