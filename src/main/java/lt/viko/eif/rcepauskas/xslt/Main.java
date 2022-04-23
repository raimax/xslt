package lt.viko.eif.rcepauskas.xslt;

public class Main {
    public static void main(String[] args) {
        try {
            XslTransformer.transformToHtml(
                    "src/main/resources/blog.xml",
                    "src/main/resources/html/blog.xsl",
                    "src/main/resources/html/index.html");

            XslTransformer.transformToPdf("src/main/resources/blog.xml",
                    "src/main/resources/pdf/blog.xsl",
                    "src/main/resources/pdf/blog.pdf");
        }
        catch (Exception ex) {
            System.out.println("Transformation error: " + ex.getMessage());
        }
    }
}
