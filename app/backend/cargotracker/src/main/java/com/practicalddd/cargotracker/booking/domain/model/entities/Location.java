package com.practicalddd.cargotracker.booking.domain.model.entities;

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * 位置
 * 5桁のUNロケーションコードで表される
 */
@Embeddable
public class Location {

    @Column(name = "origin_id")
    private String unLocCode;
    public Location(){}
    public Location(String unLocCode){this.unLocCode = unLocCode;}
    public void setUnLocCode(String unLocCode){this.unLocCode = unLocCode;}
    public String getUnLocCode(){return this.unLocCode;}
}
