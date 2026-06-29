interface Document {
    void open();
}

class WordDocument implements Document {
    public void open() {
        System.out.println("Word Document Opened");
    }
}

class PdfDocument implements Document {
    public void open() {
        System.out.println("PDF Document Opened");
    }
}

class ExcelDocument implements Document {
    public void open() {
        System.out.println("Excel Document Opened");
    }
}

abstract class DocumentFactory {
    abstract Document createDocument();
}

class WordFactory extends DocumentFactory {
    public Document createDocument() {
        return new WordDocument();
    }
}

class PdfFactory extends DocumentFactory {
    public Document createDocument() {
        return new PdfDocument();
    }
}

class ExcelFactory extends DocumentFactory {
    public Document createDocument() {
        return new ExcelDocument();
    }
}

public class FactoryMethodPatternExample {

    public static void main(String[] args) {

        DocumentFactory word = new WordFactory();
        Document doc1 = word.createDocument();
        doc1.open();

        DocumentFactory pdf = new PdfFactory();
        Document doc2 = pdf.createDocument();
        doc2.open();

        DocumentFactory excel = new ExcelFactory();
        Document doc3 = excel.createDocument();
        doc3.open();
    }
}
