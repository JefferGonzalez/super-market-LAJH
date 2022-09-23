package super_market.models;

import javax.persistence.*;
import java.util.Date;


@Entity
@Table(name ="sale_invoice")
public class SaleInvoice {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String serial_number;
    private Date date;
    private String company_name;
    private Double total_price;
}
