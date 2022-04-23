package lt.viko.eif.rcepauskas.xslt;

import org.apache.fop.apps.FOPException;
import org.apache.fop.apps.FOUserAgent;
import org.apache.fop.apps.Fop;
import org.apache.fop.apps.FopFactory;
import org.apache.fop.apps.MimeConstants;

import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

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
    public static void transformToHtml(String xmlFilePath, String xslFilePath, String outputFilePath) throws FileNotFoundException, TransformerException {
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

    public static void transformToPdf(String xmlFilePath, String xslFilePath, String outputFilePath) throws IOException, FOPException, TransformerException {
        File xmlFile = new File(xmlFilePath);
        File xslFile = new File(xslFilePath);

        if (!xmlFile.isFile()) throw new FileNotFoundException("Xml file not found");
        if (!xslFile.isFile()) throw new FileNotFoundException("Xsl file not found");

        StreamSource xmlSource = new StreamSource(xmlFile);
        FopFactory fopFactory = FopFactory.newInstance(new File("src/main/resources/pdf").toURI());
        FOUserAgent foUserAgent = fopFactory.newFOUserAgent();
        OutputStream out = new FileOutputStream(outputFilePath);

        try {
            Fop fop = fopFactory.newFop(MimeConstants.MIME_PDF, foUserAgent, out);
            TransformerFactory factory = TransformerFactory.newInstance();
            Transformer transformer = factory.newTransformer(new StreamSource(xslFile));
            Result res = new SAXResult(fop.getDefaultHandler());
            transformer.transform(xmlSource, res);
        } finally {
            out.close();
        }
    }
}
