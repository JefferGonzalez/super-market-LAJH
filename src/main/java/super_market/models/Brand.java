package super_market.models;
import javax.persistence.*;

@Entity
@Table(name = "brand")
public class Brand {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String name;
    private String description;

    public Brand() {
        
    }

    public Brand(Integer id, String name, String description) {
        this.id = id;
        this.name = name;
        this.description = description;
    }
    
}
