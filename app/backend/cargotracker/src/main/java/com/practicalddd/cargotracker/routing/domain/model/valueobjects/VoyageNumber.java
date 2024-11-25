package com.practicalddd.cargotracker.routing.domain.model.valueobjects;

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * 航海番号
 */
@Embeddable
public class VoyageNumber {
    @Column(name="voyage_number")
    private String voyageNumber;
    public VoyageNumber(){}
    public VoyageNumber(String voyageNumber){this.voyageNumber = voyageNumber;}
    public String getVoyageNumber(){return this.voyageNumber;}
    public void setVoyageNumber(String voyageNumber){this.voyageNumber = voyageNumber;}
}
