package lt.viko.eif.rcepauskas.xslt;

public class Main {
    public static void main(String[] args) {
        try {
            XslTransformer.transform(
                    "src/main/java/lt/viko/eif/rcepauskas/xslt/blog.xml",
                    "src/main/java/lt/viko/eif/rcepauskas/xslt/blog.xsl",
                    "src/main/java/lt/viko/eif/rcepauskas/xslt/output.html");
        }
        catch (Exception ex) {
            System.out.println("Transformation error: " + ex.getMessage());
        }
    }
}
