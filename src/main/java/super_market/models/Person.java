package super_market.models;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name="person")
public class Person {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String identification;
    private String name;
    private String surnames;
    private Date date_birth;
    private String email;
    private String password;
    private String telephone;


}
