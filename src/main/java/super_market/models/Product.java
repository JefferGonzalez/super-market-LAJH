package super_market.models;

import java.util.List;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
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

    @ManyToOne
    @JoinColumn(name = "category_id")
    @JsonIgnoreProperties("product")
    private Category category;

    @ManyToOne
    @JoinColumn(name = "brand_id")
    @JsonIgnoreProperties("product")
    private Brand brand;

    @OneToMany(cascade = {CascadeType.PERSIST}, mappedBy = "product_id")
    @JsonIgnoreProperties("product")
    private List<PurchaseDetail> purchase_detail;

    @OneToMany(cascade = {CascadeType.PERSIST}, mappedBy = "product_id")
    @JsonIgnoreProperties("product")
    private List<SaleDetail> sale_detail;

}
