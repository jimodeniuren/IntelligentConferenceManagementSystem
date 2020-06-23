package entity;

/**
 * @program: IntelligentConferenceManagementSystem
 * @description: 封装ConferenceRoom类
 * @create: 2020-06-22 20:16
 **/
public class ConferenceRoom {
    private int id;
    private String address;
    private int max;
    private String status;
    private String resources;

    public ConferenceRoom() {
    }

    public ConferenceRoom(int id,  String address, int max,String status, String resources) {
        this.id = id;
        this.address = address;
        this.max = max;
        this.status = status;
        this.resources = resources;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMax() {
        return max;
    }

    public void setMax(int max) {
        this.max = max;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getResources() {
        return resources;
    }

    public void setResources(String resources) {
        this.resources = resources;
    }
}
