package icu.zxb996.entity;

/**
 * @author gavin
 * @date 2022/4/18 10:08
 */
public class Address {

    private String province;

    private String city;

    private String district;

    private String street;

    private String detail;

    private String name;

    private String phone;

    private Integer type;

    private Integer userId;

    public Address() {
    }

    public Address(String province, String city, String district, String street, String detail, String name, String phone, Integer type, Integer userId) {
        this.province = province;
        this.city = city;
        this.district = district;
        this.street = street;
        this.detail = detail;
        this.name = name;
        this.phone = phone;
        this.type = type;
        this.userId = userId;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}
