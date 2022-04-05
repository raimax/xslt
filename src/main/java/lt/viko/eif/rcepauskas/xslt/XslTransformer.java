package lt.viko.eif.rcepauskas.xslt;

import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.File;
import java.io.FileNotFoundException;

/**
 * A class that is used for xsl transformations
 */
public class XslTransformer {

    /**
     * Transforms xml file to other format
     * @param xmlFilePath path to xml file
     * @param xslFilePath path to xsl file
     * @param outputFilePath output file path
     * @throws FileNotFoundException when xml or xsl file is not found
     * @throws TransformerException when transformation fails
     */
    public static void transform(String xmlFilePath, String xslFilePath, String outputFilePath) throws FileNotFoundException, TransformerException {
        File xmlFile = new File(xmlFilePath);
        File xslFile = new File(xslFilePath);

        if (!xmlFile.isFile()) throw new FileNotFoundException("Xml file not found");
        if (!xslFile.isFile()) throw new FileNotFoundException("Xsl file not found");

        TransformerFactory factory = TransformerFactory.newInstance();
        Source xslt = new StreamSource(new File(xslFilePath));
        Transformer transformer = factory.newTransformer(xslt);
        Source text = new StreamSource(new File(xmlFilePath));
        transformer.transform(text, new StreamResult(new File(outputFilePath)));
    }
}
