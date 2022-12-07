package com.model;

import com.model.User;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author George
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "users")
public class Users implements Serializable {

    @XmlElement(name = "user")
    private List<User> users = new ArrayList<>();

    public Users() {
    }

    public void add(User user) {
        this.users.add(user);
    }

    public User user(String email, String password) {
        return this.users.stream().filter(user -> user.login(email, password)).findAny().orElse(null);
    }

    public User user(String email) {
        return this.users.stream().filter(user -> user.match(email)).findAny().orElse(null);
    }

    public User user(int ID) {
        return this.users.stream().filter(user -> user.match(ID)).findAny().orElse(null);
    }

    public List<User> getUsers() {
        return users;
    }

    public void remove(User other) {
        users.removeIf(u -> u.match(other));
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    public void show() {
        this.users.forEach(u -> System.out.println(u));
    }
}
