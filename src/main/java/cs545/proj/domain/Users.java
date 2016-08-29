package cs545.proj.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
public class Users {

    @Id
    @GeneratedValue
    private int usersId;
    @NotEmpty (message = "The user name must not be null")
    private String username;
    @NotEmpty (message = "The customer password must not be null")
    @Length(min=6, message="Password should be more than 5 charactes")
    private String password;
    private Boolean enabled;
    private int customerId;

    public int getUsersId() {
        return usersId;
    }

    public void setUsersId(int usersId) {
        this.usersId = usersId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

} // The End of Class;
