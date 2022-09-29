package super_market.models;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name="status")
public class Status {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String description;

    @OneToMany(mappedBy = "status_id")
    private List<SaleInvoice> sale_invoice;

    @OneToMany(mappedBy = "status_id")
    private List<PurchaseInvoice> purchase_invoice;
    public Status() {
    }

    public Status(Integer id, String description) {
        this.id = id;
        this.description = description;
    }
}
