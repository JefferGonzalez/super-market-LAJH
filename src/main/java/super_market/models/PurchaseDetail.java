package super_market.models;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "purchase_detail")
public class PurchaseDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private Integer quantity;
    private Double price;

    @ManyToOne
    @JoinColumn(name = "product_id")
    @JsonIgnoreProperties("purchase_detail")
    private Product product;

    @ManyToOne
    @JoinColumn(name = "purchase_invoice_id")
    @JsonIgnoreProperties("purchase_detail")
    private PurchaseInvoice purchase_invoice;

}
