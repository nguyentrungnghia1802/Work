package model;

import java.sql.Timestamp;

public class Registration {
    private int id;
    private String fullName;
    private String email;
    private String phone;
    private String className;
    private String packageType;
    private String note;
    private Timestamp registrationDate;
    private String status;
    
    // Constructors
    public Registration() {}
    
    public Registration(String fullName, String email, String phone, String className, String packageType, String note) {
        this.fullName = fullName;
        this.email = email;
        this.phone = phone;
        this.className = className;
        this.packageType = packageType;
        this.note = note;
        this.status = "ACTIVE";
    }
    
    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    
    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }
    
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    
    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }
    
    public String getClassName() { return className; }
    public void setClassName(String className) { this.className = className; }
    
    public String getPackageType() { return packageType; }
    public void setPackageType(String packageType) { this.packageType = packageType; }
    
    public String getNote() { return note; }
    public void setNote(String note) { this.note = note; }
    
    public Timestamp getRegistrationDate() { return registrationDate; }
    public void setRegistrationDate(Timestamp registrationDate) { this.registrationDate = registrationDate; }
    
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    
    @Override
    public String toString() {
        return "Registration{" +
                "id=" + id +
                ", fullName='" + fullName + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", className='" + className + '\'' +
                ", packageType='" + packageType + '\'' +
                ", registrationDate=" + registrationDate +
                ", status='" + status + '\'' +
                '}';
    }
}
