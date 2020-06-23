package entity;

/**
 * @program: IntelligentConferenceManagementSystem
 * @description: 封装AttendenceRecord类
 * @create: 2020-06-22 20:17
 **/
public class AttendenceRecord {
    private int conferenceId;
    private String conferenceName;
    private int participantId;
    private String participantName;

    public AttendenceRecord() {
    }

    public AttendenceRecord(int conferenceId, String conferenceName, int participantId, String participantName) {
        this.conferenceId = conferenceId;
        this.conferenceName = conferenceName;
        this.participantId = participantId;
        this.participantName = participantName;
    }

    public int getConferenceId() {
        return conferenceId;
    }

    public void setConferenceId(int conferenceId) {
        this.conferenceId = conferenceId;
    }

    public String getConferenceName() {
        return conferenceName;
    }

    public void setConferenceName(String conferenceName) {
        this.conferenceName = conferenceName;
    }

    public int getParticipantId() {
        return participantId;
    }

    public void setParticipantId(int participantId) {
        this.participantId = participantId;
    }

    public String getParticipantName() {
        return participantName;
    }

    public void setParticipantName(String participantName) {
        this.participantName = participantName;
    }
}
