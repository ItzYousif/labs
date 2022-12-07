package com.app;

import com.utils.In;
import com.model.User;
import com.model.Users;
import com.model.dao.UserDAO;
import java.io.IOException;
import javax.xml.bind.JAXBException;

/**
 *
 * @author George
 */
public class JAXBapp {
    public static void main(String[] args) throws JAXBException, IOException {
        JAXBapp app = new JAXBapp();
        app.menu();
    }
    
    private String fileName = "C:\\Users\\236369\\Documents\\NetBeansProjects\\labs\\src\\main\\webapp\\WEB-INF\\users.xml";
    private Users users;
    private UserDAO userDAO;
    
    public JAXBapp(){  
        System.out.println("Loading ...");
        userDAO = new UserDAO();
    }
    
    private int readID(){
        System.out.print("ID: ");
        return In.nextInt();
    }
    
    private String readString(String prompt){
        System.out.print(prompt);
        return In.nextLine();
    }
    
    private void read(){
        int ID = readID();
        users = userDAO.getUsers();
        User user = users.user(ID);
        if(user != null)
            System.out.println(user);
        else
            System.out.println("User does not exist");
    }
    
    private void create() throws JAXBException, IOException{
        String name = readString("Name: ");
        String email = readString("Email: ");
        String password = readString("Password: ");
        String dob = readString("Date of Birth: ");

        User user = new User(name, email, password, dob);        
        User xmlUser = null;
        users = userDAO.getUsers();
        while((xmlUser = users.user(user.getID())) != null){
             user = new User(name, email, password, dob);           
        }
        
        users.add(user);
        userDAO.save(users, fileName);
    }
    
    private void update() throws JAXBException, IOException{
        int ID = readID();
        String password = readString("Password: ");
        
        users = userDAO.getUsers(); //get the data from XML
        
        User user = users.user(ID);
        if(user != null){
            user.setPassword(password);
            userDAO.update(users, user);
        }else{
            System.out.println("User does not exist");
        }
    }
    
    private void delete() throws JAXBException, IOException{
        int ID = readID();
       
        users = userDAO.getUsers();        
        User user = users.user(ID);
        
        if(user != null){          
            userDAO.delete(users, user);
        }else{
            System.out.println("User does not exist");
        }
    }
    
    private void view(){
        users = userDAO.getUsers(); 
        users.show();
    }
    
    private char readChoice(){
        System.out.print("Choice (c/r/u/d/v/x)");
        return In.nextChar();
    }
    
    private void menu() throws JAXBException, IOException{
        char c;
        
        while((c = readChoice()) != 'x'){
            switch(c){
                case 'c': create(); break;
                case 'r': read(); break;
                case 'u': update(); break;
                case 'd': delete(); break;
                default: System.out.println("Unknown Command");
            }
        }
    }
}
