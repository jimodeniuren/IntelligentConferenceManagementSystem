package entity;

import java.util.Date;

/**
 * @program: IntelligentConferenceManagementSystem
 * @description: 封装Conference类
 * @create: 2020-06-22 20:14
 **/
public class Conference {
    private String conferenceName;
    private int conferenceId;
    private int conferenceType;
    private int mrId;
    private int hostId;
    private String hostDepartment;
    private Date startTime;
    private Date endTime;
    private int conferenceStatus;

    public Conference() {
    }

    public Conference(String conferenceName, int conferenceId, int conferenceType, int mrId, int hostId, String hostDepartment, Date startTime, Date endTime, int conferenceStatus) {
        this.conferenceName = conferenceName;
        this.conferenceId = conferenceId;
        this.conferenceType = conferenceType;
        this.mrId = mrId;
        this.hostId = hostId;
        this.hostDepartment = hostDepartment;
        this.startTime = startTime;
        this.endTime = endTime;
        this.conferenceStatus = conferenceStatus;
    }

    public String getConferenceName() {
        return conferenceName;
    }

    public void setConferenceName(String conferenceName) {
        this.conferenceName = conferenceName;
    }

    public int getConferenceId() {
        return conferenceId;
    }

    public void setConferenceId(int conferenceId) {
        this.conferenceId = conferenceId;
    }

    public int getConferenceType() {
        return conferenceType;
    }

    public void setConferenceType(int conferenceType) {
        this.conferenceType = conferenceType;
    }

    public int getMrId() {
        return mrId;
    }

    public void setMrId(int mrId) {
        this.mrId = mrId;
    }

    public int getHostId() {
        return hostId;
    }

    public void setHostId(int hostId) {
        this.hostId = hostId;
    }

    public String getHostDepartment() {
        return hostDepartment;
    }

    public void setHostDepartment(String hostDepartment) {
        this.hostDepartment = hostDepartment;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public int getConferenceStatus() {
        return conferenceStatus;
    }

    public void setConferenceStatus(int conferenceStatus) {
        this.conferenceStatus = conferenceStatus;
    }
}
