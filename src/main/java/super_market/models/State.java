package super_market.models;

import javax.persistence.*;

@Entity
@Table(name="state")
public class State {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String description;

    public State() {
    }

    public State(Integer id, String description) {
        this.id = id;
        this.description = description;
    }
}
