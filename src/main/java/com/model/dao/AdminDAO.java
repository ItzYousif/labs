package com.model.dao;

import com.model.Admins;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

/**
 *
 * @author George
 */
public class AdminDAO {

    private Admins admins;
    private String fileName;

    public AdminDAO() {
    }

    public AdminDAO(Admins admins, String fileName) {
        this.admins = admins;
        this.fileName = fileName;
    }

    public void setFileName(String fileName) throws JAXBException, FileNotFoundException {
        this.fileName = fileName;
        JAXBContext jc = JAXBContext.newInstance(Admins.class);
        Unmarshaller um = jc.createUnmarshaller();
        FileInputStream fin = new FileInputStream(fileName);
        admins = (Admins) um.unmarshal(fin);
    }

    public String getFileName() {
        return fileName;
    }

    public Admins getAdmins() {
        return admins;
    }

    public Admins read(String filename) throws JAXBException, FileNotFoundException {
        this.fileName = filename;
        JAXBContext jc = JAXBContext.newInstance(Admins.class);
        Unmarshaller um = jc.createUnmarshaller();
        FileInputStream fin = new FileInputStream(filename);
        admins = (Admins) um.unmarshal(fin);
        return admins;
    }

//    public void save(Admins admins, String filename) throws JAXBException, FileNotFoundException, IOException {
//        this.admins = admins;
//        this.filePath = filename;
//        JAXBContext jc = JAXBContext.newInstance(Admins.class);
//        Marshaller m = jc.createMarshaller();
//        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
//        FileOutputStream fout = new FileOutputStream(filename);
//        m.marshal(admins, fout);
//        m.marshal(admins, System.out);
//        fout.close();
//    }

}
