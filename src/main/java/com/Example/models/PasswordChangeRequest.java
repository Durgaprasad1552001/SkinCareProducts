package com.Example.models;

public class PasswordChangeRequest {
    private String customerId;
    private String previousPassword;
    private String newPassword;

    // Constructors
    public PasswordChangeRequest() {
    }

    public PasswordChangeRequest(String customerId, String previousPassword, String newPassword) {
        this.customerId = customerId;
        this.previousPassword = previousPassword;
        this.newPassword = newPassword;
    }

    // Getters and Setters
    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public String getPreviousPassword() {
        return previousPassword;
    }

    public void setPreviousPassword(String previousPassword) {
        this.previousPassword = previousPassword;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

    // toString method to print object details
    @Override
    public String toString() {
        return "PasswordChangeRequest{" +
                "customerId='" + customerId + '\'' +
                ", previousPassword='" + previousPassword + '\'' +
                ", newPassword='" + newPassword + '\'' +
                '}';
    }
}

