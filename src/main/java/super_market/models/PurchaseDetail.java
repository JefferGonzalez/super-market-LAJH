package super_market.models;
import javax.persistence.*;

@Entity
@Table(name = "purchase_detail")
public class PurchaseDetail {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private Integer quantity;
    private Double price;
    
    public PurchaseDetail() {
        
    }

    public PurchaseDetail(Integer id, Integer quantity, Double price) {
        this.id = id;
        this.quantity = quantity;
        this.price = price;
    }

}
