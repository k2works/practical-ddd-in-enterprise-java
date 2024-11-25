package com.practicalddd.cargotracker.booking.domain.model.commands;



/**
 * 貨物経路
 */
public class RouteCargoCommand {
    private String cargoBookingId;

    public RouteCargoCommand(){ }

    public RouteCargoCommand(String cargoBookingId){
        this.setCargoBookingId(cargoBookingId);
    }


    public String getCargoBookingId() {
        return cargoBookingId;
    }

    public void setCargoBookingId(String cargoBookingId) {
        this.cargoBookingId = cargoBookingId;
    }


}
