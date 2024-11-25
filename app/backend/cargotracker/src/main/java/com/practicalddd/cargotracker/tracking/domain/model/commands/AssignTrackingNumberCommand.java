package com.practicalddd.cargotracker.tracking.domain.model.commands;

import java.util.Date;

/**
 * 追跡番号割り当て
 */
public class AssignTrackingNumberCommand {
    private String bookingId;
    private String trackingNumber;

    public AssignTrackingNumberCommand(){}

    public AssignTrackingNumberCommand(String bookingId,String trackingNumber){
        this.bookingId = bookingId;
        this.trackingNumber = trackingNumber;
    }

    public void setBookingId(String bookingId){ this.bookingId = bookingId; }
    public String getBookingId(){return this.bookingId;}

    public void setTrackingNumber(String trackingNumber){this.trackingNumber = trackingNumber;}
    public String getTrackingNumber(){return this.trackingNumber;}
}