package super_market.models;
import javax.persistence.*;

@Entity
@Table(name = "product")
public class Product {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String name;
    private String description;
    private Double sale_price;
    private Double purchase_price;
    private Integer stock;

    public Product() {
        
    }

    public Product(Integer id, String name, String description, Double sale_price, Double purchase_price, Integer stock) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.sale_price = sale_price;
        this.purchase_price = purchase_price;
        this.stock = stock;
    }
    
}
