package super_market.models;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Data
@Entity
@Table(name="purchase_invoice")
public class PurchaseInvoice {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String serial_number;
    private Date date;
    private String company_name;
    private Double total_price;

    @ManyToOne
    @JoinColumn(name = "status_id")
    private Status status_id;
    @ManyToOne
    @JoinColumn(name = "employee_id")
    private Person employee_id;
    @ManyToOne
    @JoinColumn(name = "supplier_id")
    private Person supplier_id;

    @OneToMany
    private List<PurchaseDetail> purchaseDetail;
    public PurchaseInvoice() {
    }

    public PurchaseInvoice(Integer id, String serial_number, Date date, String company_name, Double total_price) {
        this.id = id;
        this.serial_number = serial_number;
        this.date = date;
        this.company_name = company_name;
        this.total_price = total_price;
    }
}
