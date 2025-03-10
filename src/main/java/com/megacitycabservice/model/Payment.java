package com.megacitycabservice.model;

import java.sql.Timestamp;

public class Payment {
    private int paymentId;
    private int bookingNumber;
    private double totalAmount;
    private Timestamp paymentDate;

    public Payment(int paymentId, int bookingNumber, double totalAmount, Timestamp paymentDate) {
        this.paymentId = paymentId;
        this.bookingNumber = bookingNumber;
        this.totalAmount = totalAmount;
        this.paymentDate = paymentDate;
    }

    // Getters and setters
    public int getPaymentId() { return paymentId; }
    public int getBookingNumber() { return bookingNumber; }
    public double getTotalAmount() { return totalAmount; }
    public Timestamp getPaymentDate() { return paymentDate; }

    public void setPaymentId(int paymentId) { this.paymentId = paymentId; }
    public void setBookingNumber(int bookingNumber) { this.bookingNumber = bookingNumber; }
    public void setTotalAmount(double totalAmount) { this.totalAmount = totalAmount; }
    public void setPaymentDate(Timestamp paymentDate) { this.paymentDate = paymentDate; }
}
