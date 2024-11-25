package com.practicalddd.cargotracker.booking.domain.model.valueobjects;

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * 航海
 */
@Embeddable
public class Voyage {

    @Column(name = "voyage_number")
    private String voyageNumber;

    public Voyage(){}

    public Voyage(String voyageId){
        this.voyageNumber = voyageNumber;
    }

    public String getVoyageId(){return this.voyageNumber;}

    public void setVoyageId(String voyageId){this.voyageNumber = voyageNumber;}
}
