package dto;

import java.util.Date;

public class ComuAttachmentDto {
    private int attachment_id;
    private int post_id;
    private String file_path;
    private String file_type;
    private Date uploaded_at;

    // Getter & Setter
    public int getAttachment_id() { return attachment_id; }
    public void setAttachment_id(int attachment_id) { this.attachment_id = attachment_id; }

    public int getPost_id() { return post_id; }
    public void setPost_id(int post_id) { this.post_id = post_id; }

    public String getFile_path() { return file_path; }
    public void setFile_path(String file_path) { this.file_path = file_path; }

    public String getFile_type() { return file_type; }
    public void setFile_type(String file_type) { this.file_type = file_type; }

    public Date getUploaded_at() { return uploaded_at; }
    public void setUploaded_at(Date uploaded_at) { this.uploaded_at = uploaded_at; }
}
