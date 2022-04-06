package lt.viko.eif.rcepauskas.xslt;

public class Main {
    public static void main(String[] args) {
        try {
            XslTransformer.transform(
                    "src/main/resources/blog.xml",
                    "src/main/resources/blog.xsl",
                    "src/main/resources/index.html");
        }
        catch (Exception ex) {
            System.out.println("Transformation error: " + ex.getMessage());
        }
    }
}
